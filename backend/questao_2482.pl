:- module(questao_2482, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2482, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2482, ["sim"], "Nesse problema, note que você deve armazenar a tradução da saudação Merry Christmas nas diversas línguas de entrada.\n\c
                        Aqui cabe bem o uso de dicionário para isso, onde a chave do dicionário é a língua e o valor de cada chave é a saudação naquela língua.\n\c
                        Depois de ler todas as saudações em todas as línguas, note que basta ler os nomes das crianças e nacionalidades \c
                        para simplesmente consultar o dicionário e imprimir a saudação na nacionalidade da criança.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2482, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2482, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
