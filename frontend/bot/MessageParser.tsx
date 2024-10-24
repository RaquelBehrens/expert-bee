import React from "react";

const MessageParser = ({
  children,
  actions,
}: {
  children: any;
  actions: {
    handleFirstMessage: () => void;
    handleUserInput: () => void;
  };
}) => {
  
  const parse = (message: string) => {
    console.log(message)
    actions.handleFirstMessage();
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
