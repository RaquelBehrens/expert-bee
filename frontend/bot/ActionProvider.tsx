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

  const fetchData = async (url: string, body: URLSearchParams) => {
    try {
      const response = await fetch(url, {
        method: "POST",
        headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' },
        credentials: 'include',
        body,
      });

      if (response.status !== 200) throw new Error("Erro ao consultar o backend.");

      return await response.json();
    } catch (error) {
      return { error: "Erro ao consultar o backend." };
    }
  };

  const handleMessageResponse = async (data: any, additionalMessages: any[]) => {
    const { question, result, error } = data;

    if (error) {
      additionalMessages.push(createChatBotMessage(error, {}));
    } else if (question) {
      dispatch(addQuestion(question));
      setTimeout(() => dispatch(startCount(question.length)), 5000);

      const lines = question.split('\n');
      lines.forEach((line: string, index: number) => {
          if (line.trim() !== "") {
              const isLastLine = index === lines.length - 1;
              const message = isLastLine
                  ? createChatBotMessage(line, { widget: "yesNo" })
                  : createChatBotMessage(line, {});

              additionalMessages.push(message);
          }
      });

    } else if (result || error) {
      additionalMessages.push(createChatBotMessage(error || result || "Mensagem inválida recebida.", {}));
      const diagnosis = await handleEnd();
      if (diagnosis) additionalMessages.push(createChatBotMessage(diagnosis, {}));
      additionalMessages.push(createChatBotMessage("Gostaria de tirar dúvidas novamente?", { widget: "exerciseDropdown" }));
    }
  };

  const handleFirstMessage = async (questionNumber?: string) => {
    const body = new URLSearchParams({ questionNumber: questionNumber?.toString() || '' });
    const data = await fetchData("http://localhost:6358/server", body);
    let additionalMessages: {
      messages: {
        message: string;
        type: string;
        id: number;
        loading?: boolean;
        widget?: string | undefined;
        delay?: number | undefined;
        payload?: any;
      }[];
    }[] = [];

    await handleMessageResponse(data, additionalMessages);    
  
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
      messages: [...prev.messages, ...additionalMessages],
    }));
  };

  const handleUserInput = async (answer: string) => {
    const body = new URLSearchParams({ answer: answer.toLowerCase() });
    const data = await fetchData("http://localhost:6358/server", body);
    let additionalMessages: {
      messages: {
        message: string;
        type: string;
        id: number;
        loading?: boolean;
        widget?: string | undefined;
        delay?: number | undefined;
        payload?: any;
      }[];
    }[] = [];

    await handleMessageResponse(data, additionalMessages);
  
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
            handleYes: () => handleUserInput("sim"),
            handleNo: () => handleUserInput("não"),
            handleUserInput,
          },
        });
      })}
    </div>
  );
};

export default ActionProvider;
