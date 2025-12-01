%% Basic geometry module defined on p. 44, Ch4.
-module(geometry).
-export([area/1, test/0]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> 3.14159 * Radius * Radius.

%% compile the module and call geometry:test().
%% Example error: 
%%    ** exception error: no match of right hand side value 144
%%         in function  geometry:test/0 (.../ch04_modules_and_functions/geometry.erl:12)
test() ->
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    314.159 = area({circle, 10}),
    tests_worked.
