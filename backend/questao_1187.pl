:- module(questao_1187, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1187, [], "Você já desenvolveu sua solução mas ela não funciona?").
questao(1187, ["sim"], "Pense se os parâmetros do seu for estão corretos: 1. Você está começando na posição \c
                        correta da linha?").
questao(1187, ["sim", "não"], "Verifique se você não está calculando junto os elementos da diagonal (o 'for' precisa \c
                                começar em i+1). Próxima dica?").

questao(1187, Respostas, "2. Você está indo até a posição correta da linha?") :-
    Respostas = ["sim", "sim"];
    Respostas = ["sim", "não", "sim"];
    Respostas = ["sim", "não", "não"].

questao(1187, Respostas, "Como você quer os elementos acima da diagonal primária e da diagonal secundária, o 'for' que \c
                            percorre as colunas precisa parar um pouco antes da linha terminar. Perceba: à medida que \c
                            vamos para a próxima linha, o laço de colunas começa mais adiante e termina mais cedo. O \c
                            efeito é que ele forma o 'triângulo' de números que queremos somar, ajustando onde começa e \c
                            termina a coleta dos números. \nEm resumo: o for de colunas 'pula' alguns números no início \c
                            e no final de cada linha, criando uma seleção que pega apenas os números na área triangular \c
                            superior. \nA quantidade de colunas que ele pula no início e no final é a mesma. Ou seja, \c
                            se o for começa em 'i+1', termina em 'quantidade máxima de colunas - i - 1'.\n Próxima dica?") :-
    Respostas = ["sim", "sim", "não"];
    Respostas = ["sim", "não", "sim", "não"];
    Respostas = ["sim", "não", "não", "não"].

questao(1187, Respostas, "3. Verifique se você está calculando junto os elementos das diagonais da matriz, isso não deve \c
                            acontecer. Próxima dica?") :-
    Respostas = ["sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim"].

questao(1187, Respostas, "Você quer uma dica de qual solução adotar pra esse problema?") :-
    Respostas = ["não"];
    Respostas = ["sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "sim"].

questao(1187, Respostas, "Para entender melhor, imagine que estamos interessados apenas nos números que estão \c
                            na parte 'triangular' no topo da matriz, sem incluir os da diagonal principal (que \c
                            vai do canto superior esquerdo ao canto inferior direito) e nem os da diagonal \c
                            secundária (que vai do canto superior direito ao canto inferior esquerdo). \nAqui está \c
                            como cada for ajuda a alcançar esse objetivo:\n1. Primeiro for (para as linhas): Esse \c
                            laço percorre apenas as primeiras linhas da matriz, ou seja, a parte de cima. A quantidade \c
                            de linhas que ele percorre depende de quantas queremos incluir na nossa 'região triangular'. \n\c
                            2. Segundo for (para as colunas): Esse laço vai selecionar só algumas das colunas em cada linha:\n\c
                            Ele começa algumas colunas à frente, ou seja, pula os primeiros elementos da linha para evitar a \c
                            diagonal principal.\nEle também termina um pouco antes do fim da linha para evitar a diagonal secundária.\c\n
                            Isso significa que, à medida que vamos para a próxima linha, o laço de colunas começa mais adiante e \c
                            termina mais cedo. O efeito é que ele forma o 'triângulo' de números que queremos somar, ajustando \c
                            onde começa e termina a coleta dos números.\n Em resumo: o for de colunas 'pula' alguns números no \c
                            início e no final de cada linha, criando uma seleção que pega apenas os números na área triangular \c
                            superior.\nA quantidade de colunas que ele pula no início e no final é a mesma. Ou seja, \c
                            se o for começa em 'i+1', termina em 'quantidade máxima de colunas - i - 1'.\n Próxima dica?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "sim", "sim"].

questao(1187, Respostas, "Ainda recebe resposta errada?") :-
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "não"];
    Respostas = ["sim", "não", "sim", "sim", "não"];
    Respostas = ["sim", "não", "não", "sim", "não"];
    Respostas = ["sim", "sim", "não", "sim", "não"];
    Respostas = ["sim", "não", "sim", "não", "sim", "não"];
    Respostas = ["sim", "não", "não", "não", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "sim", "sim", "sim"].

questao(1187, Respostas, "Verifique se a divisão da média está sendo feita de forma adequada! Deu certo?") :-
    Respostas = ["não", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "não", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "não", "sim"];
    Respostas = ["sim", "não", "não", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "não", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "não", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "sim", "sim", "sim", "sim"].


% Diagnóstico com base nas respostas completas
diagnostico(1187, Respostas, "Que legal! Parabéns!") :-
    Respostas = ["não", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "não", "sim", "sim", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "não", "sim", "sim", "sim", "sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1187, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                        usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                        saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                        revisando linha por linha, ou usando prints para entender o que ele está executando!").
