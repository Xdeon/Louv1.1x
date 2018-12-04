declare
fun {Infix Tree}
   local Key Left Right LeftKeys RightKeys in
      case Tree
      of btree(1:Key left:Left right:Right) then
	 LeftKeys = {Infix Left}
	 RightKeys = {Infix Right}
	 {Append LeftKeys Key|RightKeys}
      else
	 nil
      end
   end
end

declare
Tree = btree(
     1:4
     left:btree(
             1:2
             left:btree(1:1 left:leaf right:leaf)
             right:btree(1:3 left:leaf right: leaf))
	  right:btree(1:5 left:leaf right: leaf))

{Browse {Infix Tree}}

declare
fun {FromListToTree L}
   local Insert in
      fun {Insert Key Tree}
	 case Tree
	 of btree(1:H left:Smaller right:Larger) then
	    if Key < H then
	       btree(1:H left:{Insert Key Smaller} right:Larger)
	    elseif Key > H then
	       btree(1:H left:Smaller right:{Insert Key Larger})
	    else
	       btree(1:H left:Smaller right:Larger)
	    end
	 else
	    btree(1:Key left:leaf right:leaf)
	 end
      end
      local Builder in
	 fun {Builder L Acc}
	    case L
	    of nil then Acc
	    [] H|T then
	       {Builder T {Insert H Acc}}
	    end
	 end
	 {Builder L leaf}
      end
   end
end

declare
List = [42 24 12]
Tree = btree(
    1:42
    left:btree(
            1:24
            left:btree(1:12 left:leaf right: leaf)
            right:leaf)
	  right:leaf)

{Browse {FromListToTree List}}

fun {FromTreeToList T}
   local Infix in
      fun {Infix Tree}
	 local Key Left Right LeftKeys RightKeys in
	    case Tree
	    of btree(1:Key left:Left right:Right) then
	       LeftKeys = {Infix Left}
	       RightKeys = {Infix Right}
	       {Append LeftKeys Key|RightKeys}
	    else
	       nil
	    end
	 end
      end
      {Infix T}
   end
end

{Browse {FromTreeToList Tree}}