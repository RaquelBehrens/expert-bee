:- module(questao_1259, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1259, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1259, ["sim"], "Para este problema, você deve ordenar os números primeiro pelos pares e depois pelos \c
                        ímpares. \nPara poder fazer isso no Python você pode primeiro ler todos os números e \c
                        armazenar em um vetor da seguinte forma: crie um par (t,x) onde t pode ser -1 se o \c
                        número é par e 1 se o número é ímpar. Se o número for par você armazena então (-1,x)... \c
                        porém, como os números ímpares devem ser listados em ordem decrescente, então basta \c
                        armazenar (1, -x) para o caso dos números serem ímpares. \nPara fazer a ordenação, \c
                        basta chamar vetor.sort() e depois imprimir os números. \nLembre-se que se o número for \c
                        ímpar você deve multiplicar novamente por -1 para retornar o sinal correto na saída.\n\c
                        Leia mais sobre ordenação em Python em https://www.geeksforgeeks.org/sort-in-python/\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1259, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1259, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
