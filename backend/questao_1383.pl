:- module(questao_1383, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1383, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1383, ["sim"], "No sudoku, cada linha, coluna e bloco 3x3 deve conter todos os números de 1 a 9, \n
                        sem repetições. \nNão adianta verificar se a soma de todos os elementos de uma linha,\c
                        por exemplo, é igual a soma de 1 a 9, porque existem outras combinações de números que \c
                        resultam nessa soma.\n Uma possível solução é criar um vetor para cada linha, coluna e \c
                        bloco 3x3. Em seguida, para cada número encontrado na linha, coluna ou bloco, incremente \c
                        em 1 a posição correspondente no vetor. Por fim, verifique se todos os elementos desse \c
                        vetor são iguais a 1. Deu certo?").


% Diagnóstico com base nas respostas completas
diagnostico(1383, ["sim", "sim"], "Legal! Parabéns!").

diagnostico(1383, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
