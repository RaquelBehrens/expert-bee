:- module(questao_1261, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1261, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1261, ["sim"], "Crie um dicionário em que cada palavra de entrada (as M palavras) seja uma chave, \c
                        e o valor correspondente em dólar seja o valor. \n\c
                        Sempre que encontrar uma dessas palavras na descrição do cargo, \c
                        some o valor correspondente ao salário total.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1261, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1261, _, "Você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
