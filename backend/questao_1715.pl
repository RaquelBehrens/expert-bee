:- module(questao_1715, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1715, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1715, ["sim"], "Você poderia multiplicar os elementos da linha, e, caso essa multiplicação for diferente de 0, \c
                        soma 1 no contador de jogadores que fizeram gols em todas as partidas! Deu certo?").


% Diagnóstico com base nas respostas completas

diagnostico(1715, ["sim", "sim"], "Legal! Parabéns!").

diagnostico(1715, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
