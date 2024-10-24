:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_session)).
:- use_module(library(http/http_client)).

% Define o handler para receber as requisições HTTP POST
:- http_handler(root(.), handle_post_request, [method(post)]).

% Inicialização do servidor na porta 6357
:- initialization main.

main :-
    server(6357).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Manipulador de requisições POST
handle_post_request(Request) :-
    member(method(post), Request), !,

    % Lê os dados da requisição, recebendo o número da questão
    http_read_data(Request, [questionNumber=QN|_], [encoding(utf8)]),

    % Processa a questão com base no número recebido
    process_questao(QN, Respostas),

    % Definindo os headers para permitir CORS
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-Type: application/json; charset=UTF-8'),

    % Envia a resposta em formato JSON
    reply_json_dict(_{respostas: Respostas}).

% Carrega o arquivo de questão com base no número e executa a questão correspondente
process_questao(QuestionNumber, Respostas) :-
    atom_concat('questao_', QuestionNumber, FileName),
    atom_concat(FileName, '.pl', FilePath),

    % Verifica se o arquivo existe antes de tentar carregá-lo
    (   exists_file(FilePath)
    ->  % Carrega dinamicamente o arquivo da questão
        ensure_loaded(FilePath),
        atom_number(QuestionNumber, QN),
        
        % Executa o predicado correspondente à questão com o número recebido
        (   catch(call(questao(QN, Respostas)), E2,
                (Respostas = ["Erro ao processar a questão: " + E2]))
        )
    ;   Respostas = ["Arquivo da questão não encontrado."]
    ).
