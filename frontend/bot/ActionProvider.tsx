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

      botMessage = createChatBotMessage(question, {});
    } else {
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

  const handleUserInput = async (answer: string) => {
    let botMessage;
  
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
    const result = data.result;

    console.log(data)
  
    if (response.status === 200 && result) {
      dispatch(addQuestion(result));
      botMessage = createChatBotMessage(result, {});
    } else {
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

  return (
    <div>
      {React.Children.map(children, (child) => {
        return React.cloneElement(child, {
          actions: {
            handleFirstMessage,
            handleUserInput,
          },
        });
      })}
    </div>
  );
};

export default ActionProvider;
