:- module(questao_2729, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2729, [], "Você quer uma ideia de solução pra esse problema?").
questao(2729, ["sim"], "Para esse problema podemos notar que existem no máximo 1000 itens em cada lista \c
                        (são poucos), então podemos simplesmente ler cada uma das listas e ordenar os \c
                        ítens dessa lista. \nPara a impressão da resposta devemos apenas imprimir um \c
                        determinado item se ele ainda não foi impresso antes. Como agora os itens já \c
                        estão ordenados, então basta sempre olhar se o anterior é diferente do atual. Se \c
                        for diferente, então podemos imprimir o atual.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2729, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2729, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
