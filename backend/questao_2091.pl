:- module(questao_2091, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2091, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2091, ["sim"], "Nesse problema, note que para encontrar o valor sem par basta encontrar uma quantidade ímpar de ocorrências de algum valor.\n\c
                        Para fazer a contagem de ocorrências dos valores informados, use um dicionário, onde a chave do dicionário é o valor informado.\n\c
                        Para cada chave armazene então a quantidade de ocorrências de cada valor.\n\c
                        Por fim, basta percorrer todas as chaves do dicionário buscando pelo valor com quantidade de ocorrências sendo um número ímpar.\n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(2091, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(2091, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
