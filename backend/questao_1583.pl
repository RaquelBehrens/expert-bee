:- module(questao_1583, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1583, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1583, ["sim"], "Nesse problema, similar ao problema 2465, devo verificar todas as casas que \c
                        consigo atingir com o agente contaminante. \nAssim, inicialmente devo descobrir \c
                        todas as casas com T e armazenar as coordenadas delas (i,j) em uma lista. \c
                        Depois, enquanto houverem casas com T nessa lista, devo marcar todas as casas \c
                        com A em sua vizinhança (os 4 vizinhos de sempre) agora com o símbolo T e armazenar \c
                        essas novas casas com T também nessa lista. \nEu repito esse procedimento enquanto \c
                        essa lista contiver algum elemento. \nNote que também devo controlar para evitar que \c
                        uma mesma posição (i,j) seja incluída denovo nessa mesma lista. Assim, devo utilizar \c
                        uma matriz auxiliar para marcar, por exemplo, as casas já participantes dessa lista em algum momento.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1583, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1583, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
