:- module(questao_2137, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2137, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2137, ["sim"], "Para esse problema basta armazenar todos os dados da entrada em um vetor e \c
                        então usar a função .sort() do vetor para ordenar.\n\c
                        Leia mais sobre ordenação em Python em https://www.geeksforgeeks.org/sort-in-python/\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2137, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2137, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
