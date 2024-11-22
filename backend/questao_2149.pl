:- module(questao_2149, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2149, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2149, ["sim"], "Para esse problema apenas precisamos apenas dos primeiros 17 números da sequência, \c
                        então podemos criar um vetor com 17 posições e computar todos os números logo no início, \c
                        pois são vários casos de teste e podemos reusar o que já computamos. Assim, podemos criar \c
                        uma função para computar esses valores.\n\c
                        Note que a sequência é basicamente a sequência de Fibonacci modificada. Se a posição do \c
                        elemento que queremos é par, então multiplicamos os dois anteriores. Se a posição do \c
                        elemento que queremos é ímpar, então somamos os dois anteriores.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2149, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2149, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
