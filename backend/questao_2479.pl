:- module(questao_2479, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2479, [], "Você quer uma ideia de solução pra esse problema?").
questao(2479, ["sim"], "Para esse problema podemos primeiro ler todas as crianças e ir armazenando \c
                        os nomes delas em um vetor. Ao ler cada criança, já podemos também ir acumulando \c
                        em uma variável quantas se comportaram e quantas não se comportaram. \nPara a saída, \c
                        podemos usar a função .sort() para ordenar os nomes da criança e depois seguir o \c
                        formato do enunciado para imprimir quantas se comportaram e quantas não se comportaram.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2479, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2479, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
