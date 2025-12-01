%% The short exercises from Chapter 4: Modules & Functions
%% It's best to try these directly in Erlang shell but here I keep them for reference.
%% Copy selectively whatever you want and paste it into the shell.
%% Or you can run the specific functions, such as `samples:example1().`
-module(samples).
-export([total/1, test/0]).

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
