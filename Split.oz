declare

fun {Split L}
   local Helper in
      fun {Helper L Acc1 Acc2}
	 case L
	 of nil then tuple(Acc1 Acc2)
	 [] H|T then {Helper T {Append Acc2 [H]} Acc1}
	 end
      end
      {Helper L nil nil}
   end
end

{Browse {Split [a0 a1 a2 a3]}}

declare
proc {Split1 L L1 L2}
   case L of nil then L1=L L2=L
   else case L of H|T then 
	   local T3 in
	      L1=H|T3
	      {Split1 T L2 T3}
	   end
	end
   end
end

local L1 L2 in {Split1 [a0 a1 a2 a3 a4 a5] L1 L2} {Browse L1} {Browse L2} end

declare

fun {Reduction L A B C D}
   case L 
   of nil then 0
   [] H|T then A*H+{Reduction T B C D A}
   end
end

{Browse {Reduction [1 2 3 4 5 6] 1 2 3 4}}

{Browse 1*1+2*2+3*3+4*4+1*5+2*6}