:- module(questao_1024, [questao/3, diagnostico/2]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1024, [], "Você tem dificuldade para respirar?").
questao(1024, ["sim"], "Você tem febre?").
questao(1024, ["sim", "sim"], "Você tem tosse?").
questao(1024, ["sim", "sim", "sim"], "Você perdeu o olfato ou o paladar?").
questao(1024, ["sim", "sim", "sim", "sim"], "Você provavelmente possui COVID. Recomenda-se isolamento, hidratação e acompanhamento médico.").
questao(1024, ["sim", "sim", "sim", "nao"], "Você provavelmente possui gripe. Recomenda-se repouso, hidratação e uso de analgésicos.").

% Diagnóstico com base nas respostas completas
diagnostico(["sim", "sim", "sim", "sim"], "COVID").
diagnostico(["sim", "sim", "sim", "nao"], "Gripe").
diagnostico(["sim"], "Busque ajuda médica").
diagnostico(_, "Diagnóstico inconclusivo").
