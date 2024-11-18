:- module(questao_1184, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1184, [], "Você já desenvolveu sua solução, mas não está saindo a resposta correta?").
questao(1184, ["sim"], "Você quer os elementos abaixo da diagonal principal. Ou seja, você vai percorrer por \c
                        todas as linhas, mas até o elemento com o mesmo índice do número da linha da coluna. \c
                        Por exemplo, se você estiver na linha 0, você não quer nenhum elemento daquela linha; \c
                        se você estiver na linha 1, você quer o primeiro elemento daquela linha (elemento da \c
                        coluna 1); e assim por diante. Quer saber como fica o 'for?'").
questao(1184, ["sim", "sim"], "for i in range(0, 12): for j in range(0, i). Próxima dica?").
questao(1184, ["sim", "sim", "sim"], "Verifique se você inverteu esses dois 'for's! Próxima dica?").
questao(1184, ["sim", "sim", "sim", "sim"], "Essa questão não quer que some a diagonal principal junto! Verifique \c
                                                se você não está somando também esses elementos. Deu certo?").


questao(1184, ["sim", "sim", "sim", "sim", "não"], "Verifique se o número pelo qual você está tentando dividir para \c
                                                    para conseguir a média está correto. Próxima pergunta?").


questao(1184, Respostas, "Deu Presentation Error?") :-
    Respostas = ["não"];
    Respostas = ["sim", "não"];
    Respostas = ["sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim"].

questao(1184, Respostas, "Perceba que a formatação que a questão pede é: Imprima o resultado solicitado \c
                            (a soma ou média), com 1 casa após o ponto decimal. Ou seja, '%.1f'. Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim", "sim"].


% Diagnóstico com base nas respostas completas
diagnostico(1383, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim", "sim", "sim"].

diagnostico(1184, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
