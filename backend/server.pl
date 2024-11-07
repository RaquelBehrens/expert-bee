:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_session)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_cors)).

% Define o handler para receber as requisições HTTP POST
:- http_handler(root(server), handle_post_request, [method(post)]).
:- http_handler(root(diagnosis), handle_get_diagnosis, [method(get)]).
:- http_handler(root(.), handle_options, [method(options)]).

handle_options(_Request) :-
    format('Access-Control-Allow-Origin: http://localhost:5173~n'),
    format('Access-Control-Allow-Credentials: true~n'),
    format('Access-Control-Allow-Methods: POST, GET, OPTIONS~n'),
    format('Access-Control-Allow-Headers: Content-Type~n'),
    format('Content-Length: 0~n~n').

% Inicialização do servidor na porta 6357
:- initialization main.

main :-
    server(6358).

server(Port) :-
    http_server(http_dispatch, [port(Port), allow_cors(true)]).

% Manipulador de requisições POST
handle_post_request(Request) :-
    member(method(post), Request), !,
    cors_enable(Request, [methods([post])]),
    
    % Garante que a sessão está ativa para o cliente
    http_session_id(_SessionID),

    % Lê os dados da requisição, recebendo o número da questão
    http_read_data(Request, Data, [encoding(utf8)]),

    % Definindo os headers para permitir CORS
    format('Access-Control-Allow-Origin: http://localhost:5173~n'),
    format('Access-Control-Allow-Credentials: true~n'),
    format('Content-Type: application/json; charset=UTF-8'),

    (   % Caso seja a primeira requisição da questão
        member(questionNumber=QN, Data) 
    ->  % Inicializa a sessão e a questão
        http_session_retractall(questionNumber),
        
        http_session_assert(questionNumber(QN)),
        start_question(QN, FirstQuestion),

        http_session_retractall(answers),
        http_session_assert(answers("Answers", [])),

        reply_json_dict(_{question: FirstQuestion})

    ;   % Caso receba respostas subsequentes
        member(answer=Answer, Data),
        
        % Garante que a sessão tenha a variável questionNumber
        ( http_session_data(questionNumber(QN)) ->
            continue_question(QN, Answer, NextQuestionOrResult),
            reply_json_dict(NextQuestionOrResult)
        ;   % Erro caso a sessão não tenha um questionNumber
            reply_json_dict(_{error: "Número da questão não encontrado na sessão"})
        )
    ).


% Carrega o arquivo de questão com base no número e executa a questão correspondente
start_question(QuestionNumber, FirstQuestion) :-
    atom_concat('questao_', QuestionNumber, FileName),
    atom_concat(FileName, '.pl', FilePath),

    % Verifica se o arquivo existe antes de tentar carregá-lo
    (   exists_file(FilePath)
    ->  % Carrega dinamicamente o arquivo da questão
        ensure_loaded(FilePath),
        atom_number(QuestionNumber, QN),        
        
        % Executa o predicado correspondente à questão com o número recebido
        (   catch(call(questao(QN, [], FirstQuestion)), E2,
                (FirstQuestion = "Erro ao processar a questão: " + E2))
        )
    ;   FirstQuestion = "Questão não encontrada."
    ).

% Processa a resposta recebida e decide a próxima pergunta ou resultado final
continue_question(QuestionNumber, Answer, Response) :-
    (   string(Answer) -> AW = Answer
    ;   atom(Answer) -> atom_string(Answer, AW)
    ;   term_string(Answer, AW)
    ),
    atom_number(QuestionNumber, QN), 

    % Salva a resposta na sessão
    http_session_data(answers("Answers", AnswerList)),
    append(AnswerList, [AW], UpdatedAnswers),
    http_session_retractall(answers("Answers", _)),
    http_session_assert(answers("Answers", UpdatedAnswers)),

    % Chama a questão correspondente com a lista atualizada de respostas
    (   questao(QN, UpdatedAnswers, NextQuestion)
    ->  Response = _{question: NextQuestion}
    ;   Response = _{result: "Fim"}
    ).


% Manipulador de requisições GET para obter o diagnóstico
handle_get_diagnosis(Request) :-
    cors_enable(Request, [methods([get])]),

    % Garante que a sessão está ativa
    http_session_id(SessionID),

    % Definindo os headers para permitir CORS
    format('Access-Control-Allow-Origin: http://localhost:5173~n'),
    format('Access-Control-Allow-Credentials: true~n'),
    format('Content-Type: application/json; charset=UTF-8'),
    
    % Verifica se o número da questão e as respostas estão na sessão
    (   http_session_data(questionNumber(QuestionNumber)),
        http_session_data(answers("Answers", AnswerList))
    ->  % Calcula o diagnóstico baseado nas respostas acumuladas
        atom_number(QuestionNumber, QN), 
        final_response(QN, AnswerList, Result),
        reply_json_dict(_{result: Result})

    ;   % Caso os dados da sessão estejam incompletos
        reply_json_dict(_{error: "Número da questão ou respostas não encontradas na sessão"})
    ),
    
    http_close_session(SessionID).

% Predicado para determinar o diagnóstico final baseado nas respostas
final_response(QuestionNumber, Answers, Result) :-
    process_questao(QuestionNumber, Answers, Result).

% Função para processar o diagnóstico no arquivo `questao_numero.pl`
process_questao(QuestionNumber, Answers, Result) :-
    atom_concat('questao_', QuestionNumber, FileName),
    atom_concat(FileName, '.pl', FilePath),
    (   exists_file(FilePath)
    ->  ensure_loaded(FilePath),
        (   diagnostico(QuestionNumber, Answers, Result)
        ->  true
        ;   Result = "Sem conclusão final."
        )
    ;   Result = "Questão não encontrada."
    ).