:- module(questao_2987, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2987, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2987, ["sim"], "Cada letra do alfabeto é chave do dicionário e o seu valor é a posição da letra.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2987, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2987, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
