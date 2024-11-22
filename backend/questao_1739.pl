:- module(questao_1739, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1739, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1739, ["sim"], "Essa função terá como objetivo encontrar os 60 primeiros números da sequência de threebonacci. \n\c
                        Para isso vou gerando números da sequência de Fibonacci e testando se eles fazem parte da \c
                        sequência de threebonacci. \nComo cada número da sequência de Fibonacci é sempre gerado pela \c
                        soma dos dois últimos, então não preciso armazenar todos eles. Bata eu utilizar a informação \c
                        dos dois últimos.\nComo na entrada são vários casos de teste, basta armazenar no vetor uma \c
                        única vez todos os números da sequência. \n\c
                        Próxima dica?").

questao(1739, Respostas, "Deu Wrong Answer?") :-
    Respostas = ["não"];
    Respostas = ["sim", "sim"].

questao(1739, Respostas, "Note que basta uma das condições ser verdade para que ele seja um número da sequência de threebonacci. \n\c
                          Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1739, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim"].

diagnostico(1739, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").