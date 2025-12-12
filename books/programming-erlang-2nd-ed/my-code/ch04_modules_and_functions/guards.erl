%% demonstrates usage of Guards discussed in section 4.7 (p. 64)
-module(guards).
-export([max/2, qsort/1]).

% simple example: max function
max(X,Y) when X > Y -> X;
max(_,Y) -> Y.

