:- module(questao_1430, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1430, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1430, ["sim"], "Nesse problema, você deve primeiramente armazenar a tabela dada no enunciado como um dicionário, assim você vai conseguir \c
                        rapidamente descobrir a duração de cada nota. \nUma vez que souber isso, basta acumular o valor de cada nota num mesmo compasso.\n\c
                        Note que, na leitura, você pode utilizar diretamente o input().split('/') para quebrar os compassos pelo /. \n\c
                        A função .split() do Python divide uma string em partes menores (substrings) com base no separador enviado. \c
                        Por exemplo, se executar 'maçã/banana/laranja'.split('/'), vai criar a lista ['maçã', 'banana', 'laranja']. Caso não \c
                        seja enviado um separador, a função .split() usa espaços em branco como padrão.\n\c
                        Após isso, basta percorrer cada compasso acumulando a soma das notas. \nPor fim, ao terminar de percorrer um compasso, \c
                        verifique se a soma das notas dele é igual a 1. \nCuide para comparar números com ponto decimal, assim \c
                        a solução é verificar se a diferença de 1 e a soma das notas é menor que um certo decimal muito pequeno.\nDeu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1430, ["sim", "sim"], "Legal! Parabéns!").

diagnostico(1430, ["sim", "não"], "Certifique-se de que a tabela está corretamente armazenada como um dicionário. Verifique também:\n\c
                     1. Se os compassos estão sendo divididos corretamente com `split('/')`.\n\c
                     2. Se as durações das notas estão sendo acumuladas corretamente para cada compasso.\n\c
                     3. Se a soma das notas está sendo comparada a 1 com a tolerância adequada para números decimais.\n\c
                     Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").

diagnostico(1430, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").