-module(records).
% TODO: is this the right way to include record definitions??
-include_lib("records.hrl").
-export([demo/0, clear_status/1, do_something/1]).

demo() ->
                                                % create an empty record
    X = #todo{},
                                                % create a more interesting record
    X1 = #todo{status=urgent, text="Fix it!"},
                                                % Make a copy of an existing record.
    X2 = X1#todo{status=done},
                                                % pattern matching
    #todo{who=W,text=Txt} = X2,
    {{X, X1, X2}, {W, Txt}}.

%% Pattern matching a record in a function definition
%% R is an entire record
clear_status(#todo{status=_S, who=_W} = R) ->
    % make a copy of the recrod with status set to finished.
    R#todo{status=finished}.


%% Matching a record of particular type
do_something(X) when is_record(X, todo)->
    {X, "is a todo record"}.
