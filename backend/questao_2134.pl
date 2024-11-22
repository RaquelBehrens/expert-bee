:- module(questao_2134, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2134, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2134, ["sim"], "Esse problema é muito parecido com o problema do GodoFor. Não preciso ordenar todos os \c
                        dados da entrada e nem armazenar eles em um vetor. Basta apenas armazenar o infeliz \c
                        reprovado atual. \nAssim, ao iniciar a leitura dos dados da entrada, use o primeiro \c
                        a ser lido como o infeliz reprovado até o momento. Para cada novo aluno lido, compare \c
                        o número de problemas. Se o novo aluno tiver um número de problemas menor que o atual \c
                        infeliz reprovado, então atualize o infeliz reprovado para ser o novo aluno lido. Se a \c
                        quantidade de problemas for igual, pode compara os nomes lexicograficamente (pode usar < ou >).\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2134, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2134, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
