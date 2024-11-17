import React from "react";
import { IMessageOptions } from "react-chatbot-kit/build/src/interfaces/IMessages";

const URL = import.meta.env.VITE_BACKEND_URL

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
  // const dispatch = useDispatch<AppDispatch>();

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

    if (question) {
      /* Exemplo de atualização do messages-slice, caso precise no futuro
      dispatch(addQuestion(question));
      setTimeout(() => dispatch(startCount(question.length)), 5000);
      */
      const lines = question.split('\n');
      lines.forEach((line: string, index: number) => {
          if (line.trim() !== "") {
              const isLastLine = index === lines.length - 1;
              const messageOptions = isLastLine ? { widget: "yesNo" } : {};
              additionalMessages.push(createChatBotMessage(line, messageOptions));
          }
      });
    } else if (result || error) {
      const responseText = result || error || "Mensagem inválida recebida.";
      const lines = responseText.split('\n').filter((line: string) => line.trim() !== "");
  
      lines.forEach((line: string) => {
        additionalMessages.push(createChatBotMessage(line, {}));
      });

      additionalMessages.push(createChatBotMessage("Gostaria de tirar dúvidas novamente?", { widget: "exerciseDropdown" }));
    }
  };

  const handleFirstMessage = async (questionNumber?: string) => {
    const body = new URLSearchParams({ questionNumber: questionNumber?.toString() || '' });
    const data = await fetchData(`${URL}/server`, body);
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
    const data = await fetchData(`${URL}/server`, body);
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
