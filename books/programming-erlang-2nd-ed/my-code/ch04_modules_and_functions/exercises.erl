%% Exercises from Ch4 (p. 72/3)
%% Not all of them, just the interesting ones.
%% erlang module docs: https://www.erlang.org/doc/apps/erts/erlang.html 
%%  - this documents BIFs for instance
-module(exercises).
-export([my_tuple_to_list/1, my_time_func/1, my_date_string/0, even/1, odd/1, filter/2, split/1]).


%% 2. Reimplement tuple_to_list BIF.
%% Resources
%% - C source code for tuple_to_list: https://github.com/erlang/otp/blob/aa10ffdb1908bf57786a3f35a4c1dfec46571f10/erts/emulator/beam/bif.c#L3743-L3764 
%% - Erlang tuple: Iterating over tuple: https://stackoverflow.com/questions/42891248/erlang-tuple-iterating-over-tuple
%% - tuple_size: https://stackoverflow.com/questions/20444470/does-tuple-size-count-the-elements-in-the-tuple-like-listslength
%% - Tuples and Lists: https://dzone.com/articles/erlang-tuples-and-lists
%% - solution: https://github.com/Stratus3D/programming_erlang_exercises/blob/master/chapter_4/exercise_2/my_tuple_to_list.erl
my_tuple_to_list(Tuple) ->
    my_tuple_to_list_acc(size(Tuple), Tuple, []).

my_tuple_to_list_acc(0, _Tuple, List) ->
    List;
my_tuple_to_list_acc(Remaining, Tuple, List) ->
    %% notice that we are starting with the last element so we don't need to reverse List in the base clause.
    TupleElem = element(Remaining, Tuple),
    my_tuple_to_list_acc(Remaining - 1, Tuple, [TupleElem | List]).


%% 3. Implement a couple of time related functions
%% - my_time_func(F), which evaluates the fun F and times how long it takes. 
%% - my_date_string() that neatly formats the current date and time of day
%% NOTE: now() is deprecated and should not be used. See https://www.erlang.org/doc/apps/erts/time_correction
%% => erlang:timestamp/0 seems to be a good replacement

%% measures the function execution in microseconds
%% assumes the function takes less than 1M secs to execute
my_time_func(F) ->
    {_MegasecStart, SecStart, MicrosecStart} = erlang:timestamp(),
    F(),
    {_MegasecFinish, SecFinish, MicrosecFinish} = erlang:timestamp(),
    ( SecFinish * 1000000 + MicrosecFinish) - ( SecStart * 1000000 + MicrosecStart).

%% You can try it like this:
%%     exercises:my_time_func(fun() -> timer:sleep(987) end).


my_date_string() ->
    {Y,M,D} = date(),
    {H,MM,S} = time(),
    %% see io:format examples: https://learnxbyexample.com/erlang/string-formatting/
    io:format("~B.~B.~B ~B:~B:~B~n", [D,M,Y,H,MM,S]).

%% 4. ADVANCED -> skipped


%% 5. Write a module called math_functions.erl, exporting the functions even/1 and odd/1.
even(X) -> abs(X rem 2) =:= 0.
odd(X) -> abs(X rem 2) =:= 1.


%% 6. filter
filter(_F, []) -> [];
filter(F, [H|T]) ->
    case F(H) of
        true -> [H | filter(F, T)];
        false -> filter(F,T)
    end.


%% 7. split
% which returns {Even, Odd} where Even is a list of all the even numbers in L 
% and Odd is a list of all the odd numbers in L. 
% Write this function in two different ways using accumulators
% and using the function filter you wrote in the previous exercise.
split(L) ->
    Evens = filter(fun even/1, L),
    Odds = filter(fun odd/1, L),
    {Evens, Odds}.
