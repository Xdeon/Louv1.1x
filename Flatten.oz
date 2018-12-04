

%flatten(List) when is_list(List) ->
%    do_flatten(List, []).

%flatten(List, Tail) when is_list(List), is_list(Tail) ->
%    do_flatten(List, Tail).

%do_flatten([H|T], Tail) when is_list(H) ->
%    do_flatten(H, do_flatten(T, Tail));
%do_flatten([H|T], Tail) ->
%    [H|do_flatten(T, Tail)];
%do_flatten([], Tail) ->
%    Tail.

declare
fun {FlattenList L}
   local DoFlatten in
      fun {DoFlatten L Tail}
	 case L
	 of nil then Tail
	 else
            case L.1
            of _|_ then {DoFlatten L.1 {DoFlatten L.2 Tail}}
            else L.1|{DoFlatten L.2 Tail}
	    end
	 end
      end
      {DoFlatten L nil}
   end
end

{Browse {FlattenList [1 [[2] 3]]}}
	       
   