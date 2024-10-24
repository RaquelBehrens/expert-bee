:- dynamic q/2.

diagnostico(busqueajuda) :- is_true("tem dificuldade respirar").
diagnostico(covid) :- is_true("tem febre"), is_true("tem tosse"), (is_true("tem perda olfato") ; is_true("tem perda paladar")).
diagnostico(gripe) :- is_true("tem febre"), is_true("tem tosse"), is_true("tem dor garganta").

questao(1024) :- clean, diagnostico(X),
        (
                X = busqueajuda ->
                        writeln("Você deve buscar ajuda imediatamente")
                ;
                write("Você provavelmente possui "), writeln(X),
                        (
                                X = covid -> writeln("As recomendações para covid são:\nIsolamento\nHidratação\nAcompanhamento médico")
                                ;
                                X = gripe -> writeln("As recomendações para gripe são:\nRepouso\nHidratação\nUso de analgésicos")
                        ),
                writeln("É sugerido também um teste específico para confirmar o diagnóstico")
        ).

questao :- 
        (
                writeln("Não existe!")
        ).

is_true(Q) :-
        not(q(Q,X)),
        format("~s?\n", [Q]),
        read(X),
        assert(q(Q,X)),
        X = sim, !;
        q(Q,sim).

clean :- retractall(q(_,_)).