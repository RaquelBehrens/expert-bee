import React from "react";
import { IMessageOptions } from "react-chatbot-kit/build/src/interfaces/IMessages";
import { useDispatch } from "react-redux";
import { AppDispatch } from "../redux/store";
import { addQuestion } from "../redux/features/messages-slice";


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

  const handleFirstMessage = (question?: number) => {
    setState(
      async (prev: {
        messages: {
          message: string;
          type: string;
          id: number;
          loading?: boolean;
          widget?: string | undefined;
          delay?: number | undefined;
          payload?: any;
        }[];
      }) => {
        let botMessage;
        
        const exercise = question?.toString()
        const response = await fetch("http://localhost:6358", {
          method: "POST",
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
          },
          body: new URLSearchParams({ 
            questionNumber: exercise || '',
            answers: JSON.stringify([]),
          })
        });

        const data = await response.json();

        dispatch(addQuestion(data.lastQuestion || ""))
        
        if (response.status == 200) {
          botMessage = createChatBotMessage(data.lastQuestion || `Diagnóstico: ${data.lastQuestion}`, {});
        } else {
          botMessage = createChatBotMessage("Não foi possível identificar.", {});
        }

        return {
          ...prev,
          messages: [...prev.messages, botMessage],
        };
      }
    );
  };

  const handleUserInput = (question?: number) => {
    setState(
      async (prev: {
        messages: {
          message: string;
          type: string;
          id: number;
          loading?: boolean;
          widget?: string | undefined;
          delay?: number | undefined;
          payload?: any;
        }[];
      }) => {
        let botMessage;
      const lastQuestion = prev.messages[prev.messages.length - 1]?.message;
      const exercise = question?.toString()

      if (lastQuestion) {
        const response = await fetch("http://localhost:6357", {
          method: "POST",
          body: new URLSearchParams({ 
            answer: '',
            exercise: exercise || '',
          })
        });

        const data = await response.json();

        dispatch(addQuestion(data.lastQuestion || ""))
        
        if (response.status == 200) {
          botMessage = createChatBotMessage(data.lastQuestion || `Diagnóstico: ${data.lastQuestion}`, {});
        } else {
          botMessage = createChatBotMessage("Não foi possível identificar.", {});
        }

        return {
          ...prev,
          messages: [...prev.messages, botMessage],
        };
      }
      }
    );
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
