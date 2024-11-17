:- module(questao_1763, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1763, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1763, ["sim"], "Crie um dicionário onde a chave é o país e a mensagem de Natal é o valor. \n\c
                        Para cada item da entrada, verifique se ele existe no dicionário. \n\c
                        Se não existir, imprima o not found. Caso contrário, imprima a mensagem de Natal. \n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1763, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1763, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
