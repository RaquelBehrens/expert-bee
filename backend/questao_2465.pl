:- module(questao_2465, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2465, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2465, ["sim"], "Você pode usar um while True para verificar, a partir da posição (a, b) na matriz, qual vizinho \c
                        tem valor '1'. Quando encontrar um vizinho com valor 1, o robô avança para essa posição. Por exemplo:\c\n
                        Se for o vizinho da direita, incremente b em 1; \n\c
                        Se for o vizinho da esquerda, decremente b em 1;\n\c
                        Se for o vizinho de cima, decremente a em 1;\n\c
                        Se for o vizinho de baixo, incremente a em 1.\n\c
                        Caso não encontre nenhum vizinho com valor 1, use break para sair do while True.\c\n
                        Quer uma dica de como não voltar para a posição que estava antes?").
questao(2465, ["sim", "sim"], "Marca a posição (a, b) como zero, antes de ir para o próximo vizinho! Deu certo?").


% Diagnóstico com base nas respostas completas

diagnostico(2465, ["sim", "sim", "sim"], "Legal! Parabéns!").

diagnostico(2465, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
