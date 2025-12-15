%% In Erlang, file inclusions are the only way to make sure
%% multiple modules share the same record definitions
%% This file can be read via Erlang shell function `rr`.
-record(todo, {status=reminder,who=juraj,text}).

