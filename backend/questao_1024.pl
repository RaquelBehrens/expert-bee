:- module(questao_1024, [questao/3]).

% Define a questão 1024
% Quando recebe answers -> precisa responder as respostas e retornar o resultado pelo Result
% Quando não recebe answers -> precisa retornar as questões pelo Result
questao(1024, Answers, Result) :- 
    clean, % Limpa respostas anteriores
    ( Answers \= [] -> 
        process_answers(Answers, Result)
    ; 
        % Result deve retornar todas as questões que estão em diagnostico, em ordem
        Result = ["tem febre?", "tem tosse?", "tem dor de garganta?", "tem dificuldade de respirar?", "tem perda de olfato?", "tem perda de paladar?"]
    ).

% Processa as respostas fornecidas
process_answers([], Result) :- 
    % Verificar se há algum diagnóstico com base nas respostas fornecidas
    (   diagnostico(Diagnostico)
    ->  Result = ["Diagnóstico: ", Diagnostico]
    ;   Result = ["Nenhum diagnóstico encontrado."]
    ).

process_answers([Answer|Rest], Result) :-
    % Processar cada resposta, assumindo que está na ordem das perguntas
    ( Answer = "tem febre?" -> assert(q("tem febre", sim))
    ; Answer = "tem tosse?" -> assert(q("tem tosse", sim))
    ; Answer = "tem dor de garganta?" -> assert(q("tem dor de garganta", sim))
    ; Answer = "tem dificuldade de respirar?" -> assert(q("tem dificuldade de respirar", sim))
    ; Answer = "tem perda de olfato?" -> assert(q("tem perda de olfato", sim))
    ; Answer = "tem perda de paladar?" -> assert(q("tem perda de paladar", sim))
    ; true
    ),
    % Recursivamente processar as próximas respostas
    process_answers(Rest, Result).

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

% is_true pergunta ao usuário se uma determinada condição é verdadeira
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
