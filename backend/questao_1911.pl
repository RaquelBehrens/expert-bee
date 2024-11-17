:- module(questao_1911, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1911, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1911, ["sim"], "Use um dicionário para armazenar cada assinatura de cada nome, ou seja, mapear nome para assinatura.\n\c
                        Depois, verifique para cada nome e assinatura escrita na folha da chamada o seguinte: \n\c
                        1. toda a assinatura original e a assinatura da chamada para o nome dado na chamada. \c
                        Se houver diferença em alguma posição, anote.\n\c
                        2. Se a quantidade de diferenças encontradas for superior à 1, então some a quantidade de assinaturas falsas. \n\c
                        Deu certo?").

% Diagnóstico com base nas respostas completas
diagnostico(1911, ["sim", "sim"], "Legal! Parabéns!").
diagnostico(1911, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
