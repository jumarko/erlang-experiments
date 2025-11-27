-module(exercise).
-export([start/0]).

start() ->
    House1 = {house, {number, 110}, {color, red}},
    House2 = {house, {number, 111}, {color, green}},
    House3 = {house, {number, 112}, {color, blue}},
    Street1 = [House1, House2, House3],
    Street1.

