:- module(questao_1171, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1171, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1171, ["sim"], "Como os valores de X podem ir de 1 até 2000, você pode criar um vetor onde o índice \c
                        do vetor representa cada número de o valor que estará em cada posição do vetor é a quantidade \c
                        de vezes que ele aparece. \nComo no Python o vetor inicia na posição zero, sugiro criar um \c
                        vetor de 2001 posições para poder incluir o número 2000. \nPara imprimir a saída em ordem, \c
                        basta percorrer o vetor de 1 até 2000. As posições que contém 0 não devem ser impressas e as \c
                        demais basta imprimir seguindo o formato da saída. \c\n
                        Próxima dica?").

questao(1171, Respostas, "Deu Wrong Answer?") :-
    Respostas = ["não"];
    Respostas = ["sim", "sim"].

questao(1171, Respostas, "Caso resposta errada: Verifique um caso de teste que inclua o valor 2000. Lembre-se \c
                          de na saída percorrer todos os valores de 1 até 2000, ou seja o range deve ser \c
                          range(1,2001) e não range(1, 2000). \n\c
                          https://docs.python.org/3/howto/sorting.html \n\c
                          Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1171, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim"].

diagnostico(1171, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").