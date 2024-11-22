:- module(questao_1244, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1244, [], "Você quer uma ideia de solução pra esse problema?").
questao(1244, ["sim"], "Esse problema é parecido com o dos ímpares e pares (1259). Podemos ler todas as palavras \c
                        e armazenar elas em um vetor usando um par (t, w), onde t é o tamanho da palavra e w é a \c
                        própria palavra. \nO Python já mantém a ordem original no caso de haver empates das chaves \c
                        da ordenação. \nComo estamos usando aqui um par, devemos usar como chave apenas o tamanho. \c
                        Ou seja, seja v o vetor a ser ordenado, então podemos fazer v.sort(key=lambda x: x[0]) onde \c
                        x é um dado a ser ordenado e o retorno é x[0] que é a chave que será usada para ordenação. \c
                        O índice 0 do par é justamente o tamanho. \nNote também que devemos fazer o t ser negativo, \c
                        assim (-t,w), pois queremos em ordem decrescente de tamanho.\n\c
                        Veja mais sobre ordenação em Python em https://docs.python.org/3/howto/sorting.html\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1244, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1244, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
