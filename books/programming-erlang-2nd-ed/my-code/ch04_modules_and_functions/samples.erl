%% The short exercises from Chapter 4: Modules & Functions
%% It's best to try these directly in Erlang shell but here I keep them for reference.
%% Copy selectively whatever you want and paste it into the shell.
%% Or you can run the specific functions, such as `samples:example1().`
-module(samples).
-export([total/1, test/0, test_funs/0]).

%% 4.2 Back to Shopping (Lists)
test() ->
    ShoppingList = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
    Total = total(ShoppingList),
    123 = Total,
    Total.

%% @doc
%% Fixed price assignment of costs to specific items.
cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

%% @doc
%% Calculates the total cost of items in the whole (shopping) list.
total([{What, N}|T]) -> (cost(What) * N) + total(T);
total([]) -> 0.


%% 4.3 Functions
test_funs() ->
    Double = fun(X) -> X * X end,
    81 = Double(9),
    % Doesn't work for some reason - useless output
    % io:format(["Double(9) = ~p~n", [Double(9)]]),
    Hypot = fun(X,Y) -> math:sqrt(X*X + Y*Y) end,
    5.0 = Hypot(3,4),

    %% TempCovert is an example of anonymous function with 2 clauses
    TempConvert = fun({c,C}) -> {f, 32 + C*9/5};
                     ({f,F}) -> {c, (F-32)*5/9}
                  end,
    {f, 32.0} = TempConvert({c,0}),
    {f, 212.0} = TempConvert({c,100}),
    {c, 100.0} = TempConvert({f,212}),

    tests_passed.
