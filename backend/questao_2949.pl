:- module(questao_2949, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2949, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2949, ["sim"], "Cada caractere será chave do dicionário e terá como 0 seu valor inicial. Para cada pessoa \c
                        da entrada, veja seu tipo e some 1 no valor correspondente à chave no dicionário.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2949, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2949, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
