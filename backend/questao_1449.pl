:- module(questao_1449, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1449, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1449, ["sim"], "Nesse problema, você deve considerar utilizar um dicionário para armazenar as traduções das palavras de japonês para português.\c
                        Esse dicionário deve ser utilizado zerado para cada instância da entrada.\n\c
                        Depois de preencher o dicionário com a entrada, leia o texto e para cada palavra do texto pesquise se a palavra existe \c
                        ou não no dicionário. Se não existir, imprima ela, senão se existir, então imprima a sua tradução. \c\n
                        Próxima dica?").

questao(1449, Respostas, "Deu Presentation Error?") :-
    Respostas = ["não"];
    Respostas = ["sim", "sim"].

questao(1449, Respostas, "Cuide ao imprimir a primeira palavra da saída, visto que não devem haver \c
                          espaços em branco no início e fim de cada linha. \n\c
                          Deu certo?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1449, Respostas, "Legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim"].


diagnostico(1449, Respostas, "Certifique-se de que o dicionário está sendo reinicializado corretamente para cada instância. Verifique também:\n\c
                     1. Se as palavras e traduções estão sendo armazenadas corretamente no dicionário.\n\c
                     2. Se a busca no dicionário está retornando as traduções adequadas ou mantendo as palavras originais quando não traduzidas.\n\c
                     3. Se a formatação da saída está sem espaços no início e no fim de cada linha. \n\c
                     Além disso, você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.") :-
    Respostas = ["não", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "não"].


diagnostico(1449, _, "Você pode usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                     saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                     revisando linha por linha, ou usando prints para entender o que ele está executando.").