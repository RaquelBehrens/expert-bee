:- module(questao_2398, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2398, [], "Você quer uma ideia de solução pra esse problema?").
questao(2398, ["sim"], "A partir de cada dica, marco todas as casas que consigo alcançar que respeitam \c
                        aquela dica. Essa marcação é feita por meio de um acumulador, então sempre somo 1, para \c
                        contar a quantidade de dicas que levam até aquela casa. \nAo final da última dica, devo \c
                        contar a quantidade de casas que atenderam todas as dicas. Se for mais de uma casa, \c
                        então não sei onde está o tesouro, caso contrário, sei onde está o tesouro.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2398, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2398, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
