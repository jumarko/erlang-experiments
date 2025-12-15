-module(exercises).
-export([read_config_file/1, map_search_pred/2]).

%% 1. Read configuration files containing JSON terms and turn them into Erlang maps.
%% perform some sanity checks on the data.
%% Resources
%% - https://stackoverflow.com/questions/2475270/how-to-read-the-contents-of-a-file-in-erlang
%% - https://www.erlang.org/doc/apps/stdlib/json.html#summary (Implemented in OTP release 27)
read_config_file(JsonFilePath) ->
    {ok, Data} = file:read_file(JsonFilePath),
    json:decode(Data).


%% 2. Write a function map_search_pred(Map, Pred) that returns the first element
%% in the map for which Pred(Key,Value) is true
map_search_pred(Map, Pred) ->
    search_kv(maps:to_list(Map), Pred).

search_kv([{K,V} | T], Pred) ->
    case Pred(K,V) of
        true -> {K,V};
        false -> search_kv(T, Pred)
    end;
search_kv([], _Pred) -> {}.

