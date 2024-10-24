:- dynamic q/2.

% Predicado 'questao(2048)' para a questão 2048
questao(2048, Respostas) :-
    clean,
    % Aqui vai a lógica específica para a questão 2048
    acumula_resposta("Essa é uma questão diferente", [], Respostas).

% Função auxiliar para acumular respostas
acumula_resposta(Res, RespostaAcumulada, [Res|RespostaAcumulada]).

clean :- retractall(q(_,_)).
