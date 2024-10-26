import React from "react";

const MessageParser = ({
  children,
  actions,
}: {
  children: any;
  actions: {
    handleFirstMessage: (questionNumber?: string) => void;
    handleUserInput: (questionNumber: string, answers: string[]) => void;
  };
}) => {
  
  const parse = (message: string) => {
    actions.handleFirstMessage(message);
    // if (message.includes("got it!")) {
    //   actions.handleFirstMessage();
    // } else {
    //   actions.handleUserInput();
    // }
  };

  return (
    <div>
      {React.Children.map(children, (child) =>
        React.cloneElement(child, {
          parse,
          actions,
        })
      )}
    </div>
  );
};

export default MessageParser;
