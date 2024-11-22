:- module(questao_1582, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1582, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1582, ["sim"], "Para esse problema, basta usar as fórmulas do enunciado e computar o máximo \c
                        divisor comum usando do Algoritmo de Euclides. \c\n
                        Próxima dica?").

questao(1582, Respostas, "Deu Wrong Answer?") :-
    Respostas = ["não"];
    Respostas = ["sim", "sim"].

questao(1582, Respostas, "Cuidado com espaços e acentos. Não deve haver acento. \n\c
                          Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1582, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim"].

diagnostico(1582, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").