:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_json)).

% include this module, you have sessions
:- use_module(library(http/http_client)).
:- use_module(library(http/http_session)).

:- http_handler('/', handle_post_request, []).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).


handle_post_request(Request) :-
    member(method(post), Request), !,
    http_read_data(Request, [answer=A, exercise=E, lastQuestion=LQ|_], [encoding(utf8)]),
    % Definindo os headers para permitir CORS
    format('Access-Control-Allow-Origin: *~n'),
    format('Content-Type: application/json; charset=UTF-8'),
	% Retornando o json com as informações recebidas
    reply_json_dict(_{answer: A, exercise: E, lastQuestion: LQ}).
