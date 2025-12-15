% calling this mymaps, not maps, to avoid collision with core Erlang module.
-module(mymaps).
-export([count_characters/1]).

count_characters(Str) ->
     count_characters(Str, #{}).

%% F is for "frequencies"

%% character already seen 
%% NOTE: the code from the book doesn't seem to work!!
%% the compiler complains: variable 'H' is unbound
%%   13| count_characters([H|T], #{ H := N } = F) ->
%% See https://stackoverflow.com/questions/66799585/map-pattern-matching-in-function-head
%%  and https://www.erlang.org/blog/otp-23-highlights/#matching-on-maps

%% As a result, instead of this:
%% count_characters([H|T], #{ H := N } = F) ->
%%     count_characters(T, F#{ H := N+1 });
%% count_characters([H|T], F) ->
%%     count_characters(T, F#{H => 1});

%% ... I had to re-write this:
%% ... I tried with a guard clause but that seems unsupported too
%% count_characters([H|T], F) when maps:is_key(H, F) ->
%%     count_characters(T, F#{ H := maps:get(H) + 1 });
%% ... So I ended up with this
count_characters([H|T], F) ->
    case maps:is_key(H, F) of
        true -> count_characters(T, F#{ H := maps:get(H, F) + 1 });
        false -> count_characters(T, F#{ H => 1})
    end;

count_characters([], F) -> F.

