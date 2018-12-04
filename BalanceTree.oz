declare
fun {NumLeaves Tree}
   local LeftNum RightNum in
      case Tree
      of leaf then 1
      [] btree(1:_ left:T1 right:T2) then
	 LeftNum = {NumLeaves T1}
	 RightNum = {NumLeaves T2}
	 LeftNum + RightNum
      end
   end
end

fun {IsBalanced Tree}
   local LeftNum RightNum Diff in
      case Tree
      of leaf then true
      [] btree(1:_ left:T1 right:T2) then
	 LeftNum = {NumLeaves T1}
	 RightNum = {NumLeaves T2}
	 if LeftNum > RightNum then Diff = LeftNum - RightNum
	 else Diff = RightNum - LeftNum
	 end
	 if Diff =< 1 then
	    {IsBalanced T1} andthen {IsBalanced T2}
	 else false
	 end
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

{Browse {NumLeaves Tree}}
{Browse {IsBalanced Tree}}
