:- module(questao_2251, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2251, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2251, ["sim"], "Note que o número de movimentos necessários cresce exponencialmente. Assim, o número \c
                        de movimentos pode ser obtido pela fórmula 2^N -1 onde N é o tamanho da torre original\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2251, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2251, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
