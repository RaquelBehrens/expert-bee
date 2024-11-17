:- module(questao_2654, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2654, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2654, ["sim"], "Nesse problema você deve encontrar o primeiro elemento de uma ordenação com base em alguns critérios. \c
                        Como não é necessário saber quem é o segundo, terceiro, etc... apenas deve pensar em armazenar o \c
                        'primeiro atual' e sempre comparar com os seguintes verificando se alguém é melhor que ele.\c
                        Para isso, armazene inicialmente o primeiro ser como o melhor de todos. Depois, para cada novo \c
                        ser lido, basta comparar com o ser armazenado como melhor de todos.\n\c
                        Se o novo ser é melhor, então troco, caso contrário mantenho o melhor.\n\c
                        Note que não é necessário ordenar todos os seres, pois basta controlar o primeiro colocado.\n\c
                        Próxima dica?").


questao(2654, Respostas, "Você já desenvolveu sua solução mas ela não funciona? Ou gostaria de outra dica?") :-
    Respostas = ["não"].

questao(2654, Respostas, "Maiúsculo e minúsculo são diferentes. Assim, 'G' vem antes de 'a' lexicograficamente.\n\c
                          Deu certo?") :-
    Respostas = ["não", "sim"],
    Respostas = ["sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(2654, Respostas, "Legal! Parabéns!"):-
    Respostas = ["não", "sim", "sim"],
    Respostas = ["sim", "sim", "sim"].

diagnostico(2654, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
