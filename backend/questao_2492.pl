:- module(questao_2492, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(2492, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2492, ["sim"], "Nesse problema devo dizer se as conexões apresentadas formam uma função invertível, não invertível \c
                        ou não são uma função.\n\c
                        Para uma função ser invertível, preciso para uma mesma entrada ter uma única saída, se inverter a saída \c
                        e a entrada, isso deve se manter também.\n\c
                        Para uma função ser não invertível, preciso apenas que para uma mesma entrada eu tenha uma única saída, \c
                        porém se inverter a saída pela entrada, isso pode não se manter.\n\c
                        Se não for nenhuma das duas acima, então não é uma função.\n\c
                        Quer saber como resolver isso no código?").

questao(2492, ["sim", "sim"], "Posso resolver esse problema usando dois dicionários. Um para armazenar todas as saídas para uma \c
                        determinada entrada e outro para armazenar todas as entradas para uma determinada saída.\n\c
                        Assim, posso contar quantas saídas diferentes eu tenho para cada entrada e contar quantas entradas \c
                        diferentes eu tenho para cada saída.\n\c
                        Para o primeiro dicionário, a chave seria a entrada da função e o valor seria uma lista com as saídas;\n\c
                        Para a contagem, basta contar quantos elementos existem na lista.\n\c
                        Não existe na entrada uma conexão repetida, ou seja duas vezes A -> B. Dessa forma também poderia usar como \c
                        valor do meu dicionário apenas um contador ao invés da lista.\n\c
                        Próxima dica?").

questao(2492, ["sim", "sim", "sim"], "Para e entrada de cada conexão posso usar input().split('->') assim, quebrando onde existe '->'.\n\c
                        left, right = input().split('->') #Posso quebrar a entrada pelo '->'\n\c
                        left = left.strip() #Depois removo os espaços antes e depois\n\c
                        right = right.strip()\n\c
                        Deu certo?").


% Diagnóstico com base nas respostas completas
diagnostico(2492, ["sim", "sim", "sim", "sim"], "Legal! Parabéns!").
diagnostico(2492, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                      saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                      revisando linha por linha, ou usando prints para entender o que ele está executando.").
