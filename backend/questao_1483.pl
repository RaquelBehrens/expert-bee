:- module(questao_1483, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1483, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1483, ["sim"], "Para cada número n e m, compare primeiramente os 4 últimos dígitos, depois os 3 últimos dígitos e depois os dois últimos dígitos.\n\c
                        Para pegar os 4 últimos dígitos basta usar o módulo (resto) por 10000.\n\c
                        Para pegar os 3 últimos, o módulo é por 1000... e assim por diante.\n\c
                        Se nenhum dos casos os dígitos são iguais, então verifique se os dois últimos dígitos fazem parte de um mesmo grupo de 4.\n\c
                        Por exemplo, 01, 02, 03, 04 deveriam fazer parte de um mesmo grupo.\n\c
                        Note que é possível subtrair 1 desses valores acima e extrair o quociente da divisão por 4.\n\c
                        Se dois números possuem o mesmo quociente, então eles fazem parte do mesmo grupo.\n\c
                        Por exemplo: se m e n terminarem com 29 e 31, eles fazem parte do mesmo grupo, pois 29-1=28 e 31-1=30 e o quociente da divisão \c
                        por 4 de ambos é 7 (eles fazem parte do grupo 7).
                        Deu certo?").


% Diagnóstico com base nas respostas completas
diagnostico(1483, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1483, ["sim", "não"], "Certifique-se de que está comparando os dígitos corretamente. Verifique também:\n\c
                                    1. Se os módulos estão sendo calculados corretamente para 10000, 1000 e 100.\n\c
                                    Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                                    saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                                    revisando linha por linha, ou usando prints para entender o que ele está executando.").

diagnostico(1483, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").