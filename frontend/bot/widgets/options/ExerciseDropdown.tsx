import React from "react";
import { useDispatch } from "react-redux";
import { styled } from "styled-components";
import { AppDispatch } from "../../../redux/store";
import { startCount } from "../../../redux/features/messages-slice";

const StyledSelect = styled.select`
  position: relative;
  padding: 0.5rem 1rem;
  border-radius: 5rem;
  appearance: none;
`;

const ExerciseDropdown: React.FC<any> = (props) => {
  const dispatch = useDispatch<AppDispatch>();
  const handleExercise = (e: React.ChangeEvent<HTMLSelectElement>) => {
    props.actionProvider.handleUserInput(parseInt(e.target.value));
    setTimeout(() => {
      dispatch(startCount());
    }, 5000);
  };

  const exercises = [1024, 2048, 5096]

  return (
    <StyledSelect onChange={handleExercise} title="Selecione aqui">
      <option>Selecione aqui</option>
      {Array.from(exercises).map((exercise) => (
        <option key={exercise} value={exercise}>
          {exercise}
        </option>
      ))}
    </StyledSelect>
  );
};

export default ExerciseDropdown;
