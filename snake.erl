-module(snake).
-export([snake/3]).

snake(F, 0, X) ->
	F(X);
snake(F, N, X) ->
	snake(fun(Y) -> snake(F, N-1, Y) end, N-1, X).

% F = fun(X) -> X+1 end.

% snake(F, 2, 2) =

% 	snake(F1=fun(Y)->snake(F, 1, Y) end, 1, 2)

% 	snake(F1=fun(Y)->snake(fun(Z)->snake(F, 0, Z) end, 0, Y), 1, 2)

% 	snake(F1=fun(Y)->snake(fun(Z)-> Z+1 end, 0, Y), 1, 2)

% 	snake(F1=fun(Y)-> Y+1 end, 1, 2)

% 	snake(fun(A) -> snake(F1, 0, A) end, 0, 2)

% 	snake(fun(A) -> F1(A) end, 0, 2)

% 	snake(fun(A) -> A+1 end, 0, 2)

% 	2+1