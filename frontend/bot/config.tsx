import { createChatBotMessage } from "react-chatbot-kit";
import YesNo from "./widgets/options/YesNo";
import ExerciseDropdown from "./widgets/options/ExerciseDropdown";
import IWidget from "react-chatbot-kit/build/src/interfaces/IWidget";
import IConfig from "react-chatbot-kit/build/src/interfaces/IConfig";
import beeHelper from "/bee_helper.svg";
import user from "/user.svg";

const config: IConfig = {
  botName: "Beecrowd Expert",
  initialMessages: [
    createChatBotMessage(`Olá! Bem-vindo ao Especialista em Beecrowd! Sobre qual questão você gostaria de tirar dúvidas?`, {
      widget: "exerciseDropdown",
    }),
  ],
  customStyles: {
    botMessageBox: {
      backgroundColor: "#6A2483",
    },
    chatButton: {
      backgroundColor: "#6A2483",
    },
  },
  customComponents: {
    botAvatar: (props: any) => <img src={beeHelper} alt="bot" {...props} />,
    userAvatar: (props: any) => <img src={user} alt="bot" {...props} />
  },
  widgets: [
    {
      widgetName: "yesNo",
      widgetFunc: (props: any) => <YesNo {...props} />,
    },
    {
      widgetName: "exerciseDropdown",
      widgetFunc: (props: any) => <ExerciseDropdown {...props} />,
    },
  ] as IWidget[],
};

export default config;
