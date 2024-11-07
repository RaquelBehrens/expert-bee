:- module(questao_1435, [questao/3, diagnostico/3]).

% Predicado para fornecer perguntas com base na sequência de respostas
questao(1435, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(1435, ["sim"], "Pense na menor distância entre as quatro bordas. A partir do ponto inicial, qual a  \c
                        distância do ponto até a primeira linha, até a última linha, até a primeira coluna e \c
                        até a última coluna? E qual é o mínimo entre essas quatro distâncias? Pense um pouco \c
                        sobre isso, e me informe assim que entender: você gostaria de uma dica sobre como fazer \c
                        isso no código?").
questao(1435, ["sim", "sim"], "Crie uma matriz de n linhas e colunas, e, para cada posição da matriz, calcule \c
                                a menor a distância entre aquela posição e as extremidades da matriz. Você quer \c
                                saber como calcular essas distâncias?").
questao(1435, ["sim", "sim", "sim"], "Para a distância entre o ponto e o último elemento da sua linha, faça \c
                                        [ total de colunas - coluna do elemento ]. Para a distância entre o \c
                                        ponto e o último elemento da sua coluna, faça [ total de linhas - \c
                                        linha do elemento ]. As distâncias entre o ponto e os primeiros elementos \c
                                        da linha e da coluna são a própria posição do elemento! Agora é só calcular \c
                                        o mínimo entre essas quatro distâncias! Quer ir para a próxima pergunta?").

questao(1435, Respostas, "Deu Run-time Error?") :-
    Respostas = ["não"];
    Respostas = ["sim", "não"];
    Respostas = ["sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim"].

questao(1435, Respostas, "Verifique se você não está acessando alguma posição inválida da matriz, como, por exemplo, \c
                            se sua matriz tiver 10 linhas e você tenta acessar a 11ª linha. Verifique \c
                            também se a estrutura do código está correta. Gostaria de ir para a próxima pergunta?") :-
    Respostas = ["não", "sim"];
    Respostas = ["sim", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim"].

questao(1435, Respostas, "Deu Presentation Error?") :-
    Respostas = ["não", "não"];
    Respostas = ["não", "sim", "sim"];
    Respostas = ["sim", "não", "não"];
    Respostas = ["sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "não"];
    Respostas = ["sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim"].

questao(1435, Respostas, "Preste atenção nos seguintes requisitos: 1. Deve formatar o print do número com 3 casas \c
                            decimais (com %3d); 2. Deve ter espaço em branco entre cada número; 3. Deve ter quebra \c
                            de linha entre os casos de teste. Deu certo?") :-
    Respostas = ["não", "não", "sim"];
    Respostas = ["não", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "não", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim", "sim"].


% Diagnóstico com base nas respostas completas
diagnostico(1435, Respostas, "Atente-se bem às dicas já enviadas! Além disso, você pode usar o udebug para  \c
                                verificar a diferença entre as saídas do seu código, e as saídas esperadas \c
                                pela questão! Também é uma boa ideia debugar seu código no Thonny, revisando \c
                                linha por linha, ou usando prints para entender o que ele está executando!") :-
    Respostas = ["não", "não", "sim", "não"];
    Respostas = ["não", "sim", "sim", "sim", "não"];
    Respostas = ["sim", "não", "não", "sim", "não"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "não", "não", "sim", "não"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim", "não"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim", "sim", "não"].

% Diagnóstico com base nas respostas completas
diagnostico(1435, Respostas, "Que legal! Parabéns!") :-
    Respostas = ["não", "não", "sim", "sim"];
    Respostas = ["não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "não", "não", "sim", "sim"];
    Respostas = ["sim", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "não", "sim", "sim", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "não", "sim", "sim"];
    Respostas = ["sim", "sim", "sim", "sim", "sim", "sim", "sim", "sim"].

% Diagnóstico com base nas respostas completas
diagnostico(1435, _, "Atente-se bem às dicas já enviadas ou pergunte novamente! Além disso, você pode \c
                                usar o udebug para verificar a diferença entre as saídas do seu código, e as \c
                                saídas esperadas pela questão! Também é uma boa ideia debugar seu código no Thonny, \c
                                revisando linha por linha, ou usando prints para entender o que ele está executando!").
