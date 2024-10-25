import { createChatBotMessage } from "react-chatbot-kit";
import YesNo from "./widgets/options/YesNo";
import ExerciseDropdown from "./widgets/options/ExerciseDropdown";
import IWidget from "react-chatbot-kit/build/src/interfaces/IWidget";
import IConfig from "react-chatbot-kit/build/src/interfaces/IConfig";
import beeHelper from "/bee_helper.svg";

const config: IConfig = {
  botName: "Beecrowd Specialist",
  initialMessages: [
    createChatBotMessage(`Olá! Bem-vindo ao Especialista do Beecrowd! Sobre qual questão você gostaria de tirar dúvidas?`, {
      widget: "exerciseDropdown",
    }),
  ],
  customStyles: {
    botMessageBox: {
      backgroundColor: "#376B7E",
    },
    chatButton: {
      backgroundColor: "#376B7E",
    },
  },
  customComponents: {
    botAvatar: (props: any) => <img src={beeHelper} alt="bot" {...props} />,
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
