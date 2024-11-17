:- module(questao_1181, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1181, [], "Você já desenvolveu sua solução, mas não está saindo a resposta correta?").
questao(1181, ["sim"], "Tome cuidado que a questão quer todos os elementos da linha, e não da coluna! Verifique \c
                        como você está iterando sobre a matriz: se está pegando todos os elementos de uma linha \c
                        ou todos os elementos de uma coluna. Mais uma dica sobre isso?").
questao(1181, ["sim", "sim"], "Se sua matriz é feita de forma que é iterada assim: matriz[linha][coluna], verifique \c
                                se o 'for' está correto. Quer saber como o for fica?").
questao(1181, ["sim", "sim", "sim"], "considerando que l é a entrada do usuário que indica a linha que será a \c
                                        considerada para operação: \nfor i in range(0, 12): soma += matriz[l][i]. \n\c
                                        Próxima dica?").
questao(1181, ["sim", "sim", "sim", "sim"], "Verifique se o número pelo qual você está tentando dividir para \c
                                             para conseguir a média está correto. Próxima pergunta?").


questao(1181, Respostas, "Deu Presentation Error?") :-
    Respostas = ["não"];
    Respostas = ["sim", "não"];
    Respostas = ["sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "sim"].

questao(1181, Respostas, "Perceba que a formatação que a questão pede é: Imprima o resultado solicitado \c
                            (a soma ou média), com 1 casa após o ponto decimal. Ou seja, '%.1f'. Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim"].


% Diagnóstico com base nas respostas completas
diagnostico(1181, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim", "sim"].

diagnostico(1181, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
