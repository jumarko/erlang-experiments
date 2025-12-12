%% This module shows some usage of guards, case, and if.
-module(guards_case_if).
-export([max/2, filter/2, filter2/2, iff/2, odds_and_evens/1, odds_and_evens2/1]).

max(X,Y) when X > Y -> X;
max(_X,Y) -> Y.


%% filter implemented with case:
filter(P, [H|T]) ->
    case P(H) of
        true -> [H | filter(P, T)];
        false -> filter(P,T)
        end;
filter(_P, []) -> [].

% without case it's harder because we need an intermediate function
filter2(P, [H|T]) -> filterr(P(H), H, P, T);
filter2(_P, []) -> [].

filterr(true, H, P, T) -> [H | filter2(P, T)];
filterr(false, _H, P, T) -> filter2(P,T).


%% if is a bit different - it only uses guards, and can also contain several (!) clauses
iff( X, Y) ->
    if
        X > Y -> X;
        X < Y -> Y;
        true -> "equal"
    end.


%% Accumulators
% Using list comprehensions -> traverses the list twice!
odds_and_evens(L) ->
    Odds = [X || X <- L, (X rem 2) =:= 1],
    Evens = [X || X <- L, (X rem 2) =:= 0],
    {Odds, Evens}.
% Using case is more efficient
odds_and_evens2(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of
        0 -> odds_and_evens_acc(T, Odds, [H|Evens]);
        1 -> odds_and_evens_acc(T, [H|Odds], Evens)
    end;
odds_and_evens_acc([], Odds, Evens) -> {Odds, Evens}.




