import React from "react";

const MessageParser = ({
  children,
  actions,
}: {
  children: any;
  actions: {
    handleFirstMessage: (questionNumber?: string) => void;
    handleUserInput: (answer: string) => void;
  };
}) => {
  
  const parse = (message: string) => {
    const parsedMessage = parseInt(message, 10);
    if (!isNaN(parsedMessage)) {
      actions.handleFirstMessage(message);
    } else {
      if (message == 'nao') message = 'não'
      actions.handleUserInput(message);
    }
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
