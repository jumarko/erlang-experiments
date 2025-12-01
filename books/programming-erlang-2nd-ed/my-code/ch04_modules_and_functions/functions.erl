%% 4.3 Functions
-module(functions).
-export([test_funs/0, fun_with_two_clauses/0]).

test_funs() ->
    Double = fun(X) -> X * X end,
    81 = Double(9),
    % Doesn't work for some reason - useless output
    % io:format(["Double(9) = ~p~n", [Double(9)]]),
    Hypot = fun(X,Y) -> math:sqrt(X*X + Y*Y) end,
    5.0 = Hypot(3,4),


    tests_passed.

fun_with_two_clauses() ->
    %% TempCovert is an example of anonymous function with 2 clauses
    TempConvert = fun({c,C}) -> {f, 32 + C*9/5};
                     ({f,F}) -> {c, (F-32)*5/9}
                  end,
    {f, 32.0} = TempConvert({c,0}),
    {f, 212.0} = TempConvert({c,100}),
    {c, 100.0} = TempConvert({f,212}).
