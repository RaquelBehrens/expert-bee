:- module(questao_1281, [questao/3, diagnostico/3]).

questao(1281, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1281, ["sim"], "Crie um dicionário onde cada nome de item da feira seja uma chave, \c
                        e seu preço seja o valor correspondente. \n\c
                        Depois, para cada item da lista de compras, busque no dicionário o preço \c
                        e multiplique pela quantidade, acumulando para obter o valor total.\n\c
                        Próxima dica?").

questao(1281, Respostas, "Deu Presentation Error?") :-
    Respostas = ["não"];
    Respostas = ["sim", "sim"].

questao(1281, Respostas, "Formate a saída com duas casas decimais. \n\c
                            Cuide com o espaço entre 'R$' e o valor total para evitar erros de apresentação. \n\c
                            Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "sim", "sim"].


% Diagnóstico com base nas respostas completas
diagnostico(1281, Respostas, "Que legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim"].


diagnostico(1281, Respostas, "Confira novamente o uso do dicionário e a formatação da saída. Certifique-se de que:\n\c
                     1. Todas as chaves e valores do dicionário estão corretos.\n\c
                     2. O cálculo do total considera as quantidades corretamente.\n\c
                     3. A saída está formatada com duas casas decimais e o espaço entre 'R$' e o valor.\n\c
                     Além disso, você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.") :-
    Respostas = ["não", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "não"].


diagnostico(1281, _, "Além disso, você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").
