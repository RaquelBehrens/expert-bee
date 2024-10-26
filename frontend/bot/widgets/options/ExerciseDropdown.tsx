import React from "react";
import { styled } from "styled-components";

const StyledSelect = styled.select`
  position: relative;
  padding: 0.5rem 1rem;
  border-radius: 5rem;
  appearance: none;
`;

const ExerciseDropdown: React.FC<any> = (props) => {
  const handleExercise = (e: React.ChangeEvent<HTMLSelectElement>) => {
    console.log(e.target.value)
    props.actionProvider.handleFirstMessage(e.target.value);
  };

  const exercises = [1024, 2048, 5096]

  return (
    <StyledSelect onChange={handleExercise} title="Selecione aqui">
      <option>Selecione aqui ou digite o número da questão</option>
      {Array.from(exercises).map((exercise) => (
        <option key={exercise} value={exercise}>
          {exercise}
        </option>
      ))}
    </StyledSelect>
  );
};

export default ExerciseDropdown;
