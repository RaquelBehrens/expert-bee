:- module(questao_2807, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2807, [], "Você quer uma ideia de solução pra esse problema?").
questao(2807, ["sim"], "Esses são os números da sequência de Fibonacci ao contrário. Então podemos primeiro \c
                        computar todos os N primeiros números da sequência de Fibonacci e armazenar em um vetor. \c
                        \nPara a saída basta percorrer os elementos de trás para frente, ou seja, da última \c
                        posição para a primeira.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2807, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2807, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
