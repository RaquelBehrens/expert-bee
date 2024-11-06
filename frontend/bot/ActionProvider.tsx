import React from "react";
import { IMessageOptions } from "react-chatbot-kit/build/src/interfaces/IMessages";
import { useDispatch } from "react-redux";
import { AppDispatch } from "../redux/store";
import { addQuestion, startCount } from "../redux/features/messages-slice";


const ActionProvider = ({
  createChatBotMessage,
  setState,
  children,
}: {
  createChatBotMessage: (
    message: string,
    options: IMessageOptions
  ) => {
    loading: boolean;
    widget?: string;
    delay?: number;
    payload?: any;
    message: string;
    type: string;
    id: number;
  };
  setState: any;
  children: any;
}) => {
  const dispatch = useDispatch<AppDispatch>();

  const handleFirstMessage = async (questionNumber?: string) => {
    let botMessage;
  
    const exercise = questionNumber?.toString();

    try {
      const response = await fetch("http://localhost:6358/server", {
        method: "POST",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
        },
        credentials: 'include',
        body: new URLSearchParams({
          questionNumber: exercise || '',
        }),
      });
    
      const data = await response.json();
      const question = data.question;
    
      if (response.status === 200 && question) {
        dispatch(addQuestion(question));
    
        setTimeout(() => {
          dispatch(startCount(question.length));
        }, 5000);

        botMessage = createChatBotMessage(question, {
          widget: "yesNo",
        });
      } else {
        botMessage = createChatBotMessage("Erro ao consultar o backend.", {});
      }
    } catch {
      botMessage = createChatBotMessage("Erro ao consultar o backend.", {});
    }
    
  
    setState((prev: {
      messages: {
        message: string;
        type: string;
        id: number;
        loading?: boolean;
        widget?: string | undefined;
        delay?: number | undefined;
        payload?: any;
      }[];
    }) => ({
      ...prev,
      messages: [...prev.messages, botMessage],
    }));
  };

  const handleYes = async () => {
    handleUserInput("sim")
  }

  const handleNo = async () => {
    handleUserInput("não")
  }

  const handleUserInput = async (answer: string) => {
    let botMessage;
    let additionalMessages = [];

    try {
      const response = await fetch("http://localhost:6358/server", {
        method: "POST",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
        },
        credentials: 'include',
        body: new URLSearchParams({
          answer: answer.toLowerCase()
        }),
      });
    
      const data = await response.json();
      const { question, result, error } = data;

      if (response.status === 200 && data) {
        if (question) {
          dispatch(addQuestion(question));
          botMessage = createChatBotMessage(question, {
            widget: "yesNo",
          });

        } else if (result) {
          botMessage = createChatBotMessage(result, {});
          const diagnosis = await handleEnd()
          if (diagnosis) additionalMessages.push(createChatBotMessage(diagnosis, {}));
          additionalMessages.push(createChatBotMessage(`Gostaria de tirar dúvidas novamente?`, { widget: "exerciseDropdown" }));

        } else {
          botMessage = createChatBotMessage(error || "Mensagem inválida recebida.", {});
          additionalMessages.push(createChatBotMessage(`Gostaria de tirar dúvidas novamente?`, { widget: "exerciseDropdown" }));
        }
      } else {
        botMessage = createChatBotMessage("Erro ao consultar o backend.", {});
      } 
    } catch {
      botMessage = createChatBotMessage("Erro ao consultar o backend.", {});
    }
  
    setState((prev: {
      messages: {
        message: string;
        type: string;
        id: number;
        loading?: boolean;
        widget?: string | undefined;
        delay?: number | undefined;
        payload?: any;
      }[];
    }) => ({
      ...prev,
      messages: [
        ...prev.messages, 
        botMessage,
        ...additionalMessages
      ],
    }));
  };  

  const handleEnd = async () => {
    try {
      const response = await fetch("http://localhost:6358/diagnosis", {
        method: "GET",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
        },
        credentials: 'include',
      });
    
      const data = await response.json();

      if (response.status === 200 && data) {
        return data.result
      }
    } catch {
      return "Erro ao consultar resultado final."
    }
  }

  return (
    <div>
      {React.Children.map(children, (child) => {
        return React.cloneElement(child, {
          actions: {
            handleFirstMessage,
            handleYes,
            handleNo,
            handleUserInput,
          },
        });
      })}
    </div>
  );
};

export default ActionProvider;
