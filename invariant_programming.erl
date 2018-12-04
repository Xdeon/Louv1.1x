-module(invariant_programming).

-export([reverse_int/1, is_prime/1, append/2]).

reverse_int(Int) ->
	reverse_int(Int, 0).

reverse_int(0, Acc) ->
	Acc;
reverse_int(N, Acc) ->
	reverse_int(N div 10, N rem 10 + Acc * 10).


is_prime(1) ->
	false;
is_prime(Int) ->
	is_prime(Int, 2).

is_prime(Int, Int) ->
	true;
is_prime(Int, Acc) when Int rem Acc == 0 ->
	false;
is_prime(Int, Acc) ->
	is_prime(Int, Acc + 1).

% Remember this pattern since it does not need reversing
append([], L2) ->
	L2;
append([H|T], L2) ->
	[H|append(T, L2)].

