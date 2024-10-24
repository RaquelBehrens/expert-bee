:- module(questao_1024, [questao/2]).

% Define o predicado diagnostico/1 para verificar as condições e determinar o diagnóstico
diagnostico(busqueajuda) :- is_true("tem dificuldade de respirar").
diagnostico(covid) :- 
    is_true("tem febre"), 
    is_true("tem tosse"), 
    (is_true("tem perda de olfato") ; is_true("tem perda de paladar")).
diagnostico(gripe) :- 
    is_true("tem febre"), 
    is_true("tem tosse"), 
    is_true("tem dor de garganta").

% Define a questão 1024, que realiza o diagnóstico e retorna a resposta
questao(1024, Resposta) :- 
    clean, % Limpa respostas anteriores
    diagnostico(X), % Chama o diagnóstico baseado nas respostas
    (
        X = busqueajuda -> % Se o diagnóstico for busqueajuda
            Resposta = "Você deve buscar ajuda imediatamente"
        ;
        X = covid -> % Se o diagnóstico for covid
            Resposta = "Você provavelmente possui COVID. Recomendações:\nIsolamento\nHidratação\nAcompanhamento médico"
        ;
        X = gripe -> % Se o diagnóstico for gripe
            Resposta = "Você provavelmente possui gripe. Recomendações:\nRepouso\nHidratação\nUso de analgésicos"
        ;
        Resposta = "É sugerido também um teste específico para confirmar o diagnóstico"
    ).

% is_true/1 pergunta ao usuário se uma determinada condição é verdadeira
is_true(Pergunta) :-
    (q(Pergunta, Resposta) -> 
        Resposta = sim % Se a resposta já for 'sim', retorna verdadeiro
    ; 
        format("~s?\n", [Pergunta]), % Pergunta ao usuário no terminal
        read(RespostaUsuario), % Lê a resposta do usuário
        assert(q(Pergunta, RespostaUsuario)), % Armazena a resposta no banco de fatos
        RespostaUsuario = sim % Retorna verdadeiro se a resposta foi 'sim'
    ).

% Limpa todas as respostas registradas
clean :- retractall(q(_, _)).

% Fatos dinâmicos para armazenar as respostas do usuário
:- dynamic q/2.
