%% 4.3 Functions
-module(functions).
-export([test_funs/0, fun_with_two_clauses/0, map_filter/0, funs_return_funs/0, for/3]).

test_funs() ->
    Double = fun(X) -> X * X end,
    81 = Double(9),
    % Doesn't work for some reason - useless output
    % io:format(["Double(9) = ~p~n", [Double(9)]]),
    Hypot = fun(X,Y) -> math:sqrt(X*X + Y*Y) end,
    5.0 = Hypot(3,4),

    ok.

fun_with_two_clauses() ->
    %% TempCovert is an example of anonymous function with 2 clauses
    TempConvert = fun({c,C}) -> {f, 32 + C*9/5};
                     ({f,F}) -> {c, (F-32)*5/9}
                  end,
    {f, 32.0} = TempConvert({c,0}),
    {f, 212.0} = TempConvert({c,100}),
    {c, 100.0} = TempConvert({f,212}),

    ok.

map_filter() ->
    [2,4,6] = lists:map((fun(X) -> X * 2 end), [1,2,3]),
    Even = fun(X) -> (X rem 2) =:= 0 end,
    [2,4,6] = lists:filter(Even, [1,2,3,4,5,6]).

funs_return_funs() ->
    Fruit = [apple, pear, orange],
    %% Notice the fun returning a new fun
    MakeTest = fun(L) -> (fun(X) -> lists:member(X,L) end) end,
    IsFruit = MakeTest(Fruit),
    true = IsFruit(pear),
    false = IsFruit(dog),

    [orange, apple] = lists:filter(IsFruit, [dog,orange,cat,apple,bear]),
    ok.

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].
    
