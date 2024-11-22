:- module(questao_1028, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1028, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1028, ["sim"], "O que precisamos nesse problema é do máximo divisor comum entre F1 e F2. \c
                        Para encontrar o máximo divisor comum, sugiro que pesquise sobre o Algoritmo de Euclides.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1028, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1028, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
