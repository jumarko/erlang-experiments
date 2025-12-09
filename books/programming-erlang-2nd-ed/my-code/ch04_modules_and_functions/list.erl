%% 4.4 (List processing) and 4.5 (List comprehensions)
%% In this module we add simple functions `sum` and `map`
%% and use them to implement a simplified version of the `total` function.
-module(list).
-export([sum/1, map/2, total/1, doubles/1, double_items/1, map2/2, qsort/1, pythag/1, perms/1]).
-import(simple_total, [cost/1]).

sum([]) -> 0;
sum([H|T]) -> H + sum(T).

map(_, []) -> [];
map(F, [H|T]) -> [F(H) | map(F,T)].

%% Let's now re-implement total using sum & map.
total(L) ->
    sum(map(fun({What, N}) -> simple_total:cost(What) * N end, L)).


%% List comprehensions (p. 59)
doubles(L) ->
    [2*X || X <- L].

%% Example value to use as BuyList
%%     Buy=[{oranges,4}, {newspaper, 1}, {apples,10}, {pears,6}, {milk,3}].
double_items(BuyList) ->
    [{Name, 2*Number} || {Name, Number} <- BuyList].

%% Lets redefine map using list comprehension
map2(F, L) -> [F(X) || X <- L].

%% let's implement quicksort with list comprehensions
%% Quite readable and short!
qsort([]) -> [];
qsort([Pivot|T]) -> 
    (qsort([X || X <- T, X < Pivot]))
        ++ [Pivot] ++
        (qsort([X || X <- T, X >= Pivot])).


%% Pythagorean triples
%% Generates triplets of ints such as {3,4,5}
%% such that their sum is <= N
pythag(N) ->
    [{A,B,C} || A <- lists:seq(1,N), B <- lists:seq(1,N), C <- lists:seq(1,N),
                A+B+C =< N,
                A*A + B*B =:= C*C].


%% Permutations (for anagrams)
%% Look how succinct it is!
perms([]) -> [[]]; % notice that it's an empty list inside a list of 1-elem (this is critical for the implementation to work, otherwise it always returns [])
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].
