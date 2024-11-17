:- module(questao_1953, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1953, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1953, ["sim"], "Você apenas deve contar quantos alunos são de EPR, EHD e o restante são intrusos, ou seja, n - EPR - EHD.\n\c
                        Para contar quantos são de EPR e EHD, podemos usar um dicionário, em que as chaves são EPR e EHD e o valor inicia com 0. \n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1953, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1953, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
