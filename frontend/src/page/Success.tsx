import { styled } from "styled-components";
import { useAppSelector } from "../../redux/store";
import { Navigate } from "react-router-dom";

const StyledSuccess = styled.div`
  display: grid;
  place-items: center;
  height: 100vh;
`;

const Success = () => {
  const question = useAppSelector((state) => state.messageReducer.question);
  if (question === "") {
    return <Navigate to="/" />;
  }
  return (
    <StyledSuccess>
      Your name {question.toUpperCase()} aged {question} has been added to student
      system. You may now exit.
    </StyledSuccess>
  );
};

export default Success;
