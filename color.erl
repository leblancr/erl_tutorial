-module(color).

-export([new/4, blend/2]).

% run new function with for parameters
% eg. C1 = color:new(0.3,0.4,0.5,1.0).

% a macro is_channel is defined
-define(is_channel(V), (is_float(V) andalso V >= 0.0 andalso V =< 1.0)).

% returns a map (dictionary) of names to the passed in params
new(R, G, B, A) when ?is_channel(R), ?is_channel(G),
                  ?is_channel(B), ?is_channel(A) ->
    #{red => R, green => G, blue => B, alpha => A}.

% call blend() with two parameters
blend(Src, Dst) ->
    blend(Src,Dst,alpha(Src,Dst)).

% call blend() with three parameters, returns a Dst map
blend(Src, Dst, Alpha) when Alpha > 0.0 ->
    Dst#{
        red   := red(Src,Dst) / Alpha,  % := = fetch value
        green := green(Src,Dst) / Alpha,
        blue  := blue(Src,Dst) / Alpha,
        alpha := Alpha
    };

% returns a zeroed Dst map
blend(_, Dst, _) ->
    Dst#{
        red   := 0.0,
        green := 0.0,
        blue  := 0.0,
        alpha := 0.0
    }.

% returns a combined alpha
alpha(#{alpha := SA}, #{alpha := DA}) ->
    SA + DA*(1.0 - SA).

% return a new red
red(#{red := SV, alpha := SA}, #{red := DV, alpha := DA}) ->
    SV*SA + DV*DA*(1.0 - SA).

% return a new green
green(#{green := SV, alpha := SA}, #{green := DV, alpha := DA}) ->
    SV*SA + DV*DA*(1.0 - SA).

% return a new blue
blue(#{blue := SV, alpha := SA}, #{blue := DV, alpha := DA}) ->
    SV*SA + DV*DA*(1.0 - SA).