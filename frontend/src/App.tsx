import { Suspense, lazy, useState } from "react";
import { createGlobalStyle } from "styled-components";
import { AnimatePresence } from "framer-motion";
import { Route, Routes, useLocation, useNavigate } from "react-router-dom";
import Details from "./page/Details";

const Chat = lazy(() => import("./page/Chat"));
const NotFound = lazy(() => import("./page/404"));

const GlobalStyle = createGlobalStyle`
  :root{
    --light-color: 241 241 241;
    --dark-color: 52 17 64;
    --primary-color: 106 36 131;
    --secondary-color: 169 87 190;
    --tertiary-color: 230, 213, 14;
    --quaternary-color: 245 243 213;
    --success-color: 3 179 10;
    --like-color: 16 110 190;
    --font-poppins: 'Poppins', system-ui, sans-serif;
    scroll-behavior: smooth;
  }
  ::-webkit-scrollbar {
    width: 0;
  }
  html {
    color-scheme: light;
  }
  html, body {
    overflow-x: hidden;
  }
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: var(--font-poppins);
    outline: none;
  }
  body {
    position: relative;
    background-color: rgb(var(--light-color));
    color: rgb(var(--dark-color));
    min-height: 100vh;
    display: grid;
    place-items: center;
  }
  .container {
    margin-inline: auto;
    width: min(90%, 70rem);
  }
  a {
    text-decoration: none;
    color: inherit;
    transition: 0.15s;
  }
  input{
    background-color: transparent;
  }
  button {
    cursor: pointer;
    border: none;
    background-color: transparent;
    user-select: none;
  }
  & span.loader {
    margin-bottom: 2rem;
    width: 1rem;
    height: 1rem;
    border: 2px solid #FFF;
    border-bottom-color: rgb(var(--dark-color));
    border-radius: 50%;
    display: inline-block;
    animation: rotation 1s linear infinite;
  }
  @keyframes rotation {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
  }
  #root {
    width: 100%;
    height: 100%;
  }
  & .details-button {
    position: fixed;
    bottom: 1rem;
    left: 1rem;
    z-index: 1000;
    & > h1 {
      font-size: 1rem;
    }
    & > button {
      color:rgb(var(--dark-color));
      background-color:rgb(var(--light-color));
      margin-top: 1rem;
      padding: 0.5rem 2rem;
      font-size: 1.1rem;
      border-radius: 5rem;
      border: 1px solid rgb(var(--dark-color));
      transition: 0.15s;
      &:active {
        transform: scale(0.95);
        border-color: rgb(var(--tertiary-color));
      }
    }
  }
`;

const App = () => {
  const location = useLocation();
  const navigate = useNavigate();

  const [isDetails, setIsDetails] = useState(location.pathname === "/details");

  const handleToggleNavigation = () => {
    if (isDetails) {
      navigate("/");
    } else {
      navigate("/details");
    }
    setIsDetails(!isDetails);
  };

  return (
    <>
      <GlobalStyle />
      <div className="details-button">
        <button onClick={handleToggleNavigation}>
          {isDetails
            ? "Voltar para a página inicial"
            : "Clique aqui para ler sobre os tipos de resposta do Beecrowd!"}
        </button>
      </div>
      <Suspense
        fallback={
          <div
            className="loader-container"
            style={{
              height: "100vh",
              width: "100vw",
              display: "grid",
              placeItems: "center",
            }}
          >
            <span className="loader"></span>
          </div>
        }
      >
        <AnimatePresence mode="wait">
          <Routes location={location} key={location.pathname}>
            <Route path="/" element={<Chat />} />
            <Route path="/details" element={<Details />} />
            <Route path="*" element={<NotFound />} />
          </Routes>
        </AnimatePresence>
      </Suspense>
    </>
  );
};

export default App;
