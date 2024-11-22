:- module(questao_1185, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1185, [], "Você já desenvolveu sua solução, mas não está saindo a resposta correta?").
questao(1185, ["sim"], "Você quer os elementos acima da diagonal secundária. Ou seja, você vai percorrer por \c
                        todas as linhas, mas até o último elemento da coluna menos o índice do número da linha. \c
                        Por exemplo, se você estiver na linha 0, você todos os elementos daquela linha; se você estiver \c
                        na linha 1, você todos os elementos daquela linha - 1; se você estiver na linha 2, \c
                        você quer todos os elementos daquela linha - 2, e assim por diante. \n Preste atenção que \c
                        você não quer os elementos da diagonal secundária! Pensei um pouco sobre isso e depois me \c
                        responda: quer saber como fica o 'for?'").
questao(1185, ["sim", "sim"], "for i in range(0, 12): for j in range(0, 12-i-1). Próxima dica?").
questao(1185, ["sim", "sim", "sim"], "Verifique se você inverteu esses dois 'for's! Próxima dica?").
questao(1185, ["sim", "sim", "sim", "sim"], "Verifique se o número pelo qual você está tentando dividir para \c
                                             para conseguir a média está correto. Próxima pergunta?").


questao(1185, Respostas, "Deu Presentation Error?") :-
    Respostas = ["não"];
    Respostas = ["sim", "não"];
    Respostas = ["sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "sim"].

questao(1185, Respostas, "Perceba que a formatação que a questão pede é: Imprima o resultado solicitado \c
                            (a soma ou média), com 1 casa após o ponto decimal. Ou seja, '%.1f'. Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim"].


% Diagnóstico com base nas respostas completas
diagnostico(1383, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim", "sim"].

diagnostico(1185, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
