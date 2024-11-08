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
    props.actionProvider.handleFirstMessage(e.target.value);
  };

  const exercises = [1181, 1184, 1185, 1187, 1383, 1435, 1715, 2465]
  exercises.sort()

  return (
    <StyledSelect onChange={handleExercise} title="Selecione aqui">
      <option>Selecione aqui o número da questão</option>
      {Array.from(exercises).map((exercise) => (
        <option key={exercise} value={exercise}>
          {exercise}
        </option>
      ))}
    </StyledSelect>
  );
};

export default ExerciseDropdown;
