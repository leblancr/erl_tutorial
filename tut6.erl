-module(tut6).
-export([list_max/1]).

% last list_max/1 ends with a dot.
list_max([Head|Rest]) ->
    list_max(Rest, Head).

list_max([], Res) ->
    Res;

list_max([Head|Rest], Result_so_far) when Head > Result_so_far ->
    io:format("Result_so_far1: ~w~n", [Result_so_far]),
    list_max(Rest, Head);

% last list_max/2 ends with a dot.
list_max([Head|Rest], Result_so_far)  ->
    io:format("Result_so_far2: ~w~n", [Result_so_far]),
    list_max(Rest, Result_so_far).


