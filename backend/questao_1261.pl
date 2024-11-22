:- module(questao_1261, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1261, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1261, ["sim"], "Crie um dicionário em que cada palavra de entrada (as M palavras) seja uma chave, \c
                        e o valor correspondente em dólar seja o valor. \n\c
                        Sempre que encontrar uma dessas palavras na descrição do cargo, \c
                        some o valor correspondente ao salário total.\n\c
                        Próxima dica?").

questao(1261, ["sim", "sim"], "Em cada linha recebida, use o input().split() para tratar cada palavra da linha. \c
                               Não é necessário receber o texto inteiro primeiramente, para depois verificar cada linha.
                               Próxima dica?").                     

questao(1261, Respostas, "Seu resultado foi Wrong Answer?"):-
    Respostas = ["não"];
    Respostas = ["sim", "não"];
    Respostas = ["sim", "sim", "sim"].

questao(1261, Respostas, "Verifique se você está considerando a quantidade de vezes que uma palavra aparece. \c
                          Quando uma palavra aparece várias vezes, a pontuação final fica maior? Ou apenas é considerada \c
                          uma ocorrência da palavra no salário total? Verifique. \n\c
                          Próxima dica?"):-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim"].

questao(1261, Respostas, "Para cada palavra do texto, verifique se ela aparece no dicionário. Se sim, some a pontuação que ela tem. \n\c
                          Próxima dica?"):-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim"].

questao(1261, Respostas, "Seu resultado foi Run-time Error?"):-
    Respostas = ["não", "não"];
    Respostas = ["sim", "não", "não"];
    Respostas = ["sim", "sim", "sim", "não"];
    Respostas = ["não", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "não"];
    Respostas = ["não", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim"].

questao(1261, Respostas, "Você precisa verificar se está tentando fazer input().split() na linha que possui apenas um '.' \n\c
                          Para tratar esse caso, antes de usar a função split(), verifique se o conteúdo da linha não é igual a '.'"):-
    Respostas = ["não", "não", "sim"];
    Respostas = ["sim", "não", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim"];
    Respostas = ["não", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim"];
    Respostas = ["não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1261, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1261, _, "Você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
