import React, { useEffect, useState } from "react";
import { styled } from "styled-components";

const StyledSelect = styled.select`
  position: relative;
  padding: 0.5rem 1rem;
  border-radius: 5rem;
  appearance: none;
`;

const ExerciseDropdown: React.FC<any> = (props) => {
  const [questions, setQuestions] = useState<number[]>([]);

  useEffect(() => {
    const fetchExercises = async () => {
      try {
        const response = await fetch("http://localhost:6358/questions"); // Atualize o URL conforme necessário
        const data = await response.json();
        setQuestions(data.sort());
      } catch (error) {
        console.error("Erro ao buscar exercícios:", error);
      }
    };

    fetchExercises();
  }, []);

  const handleExercise = (e: React.ChangeEvent<HTMLSelectElement>) => {
    props.actionProvider.handleFirstMessage(e.target.value);
  };

  return (
    <StyledSelect onChange={handleExercise} title="Selecione aqui">
      <option>Selecione aqui ou digite o número da questão</option>
      {Array.from(questions).map((exercise) => (
        <option key={exercise} value={exercise}>
          {exercise}
        </option>
      ))}
    </StyledSelect>
  );
};

export default ExerciseDropdown;
