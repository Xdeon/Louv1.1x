declare
fun {Prefix L1 L2}
   case L1
   of nil then true
   [] H1|T1 then 
      case L2 
      of nil then false
      [] H2|T2 then 
	 if H1==H2 then {Prefix T1 T2}
	 else false
	 end
      end
   end
end

{Browse {Prefix [a b c] [a b c d e]}}
{Browse {Prefix nil [a b c d e]}}
{Browse {Prefix [b c d] [a b c d e]}}
{Browse {Prefix [a b c] [a b]}}
{Browse {Prefix nil nil}}
{Browse {Prefix [[a b c] d] [[a b c] d e f]}}

declare
fun {FindString L1 L2}
   if {Prefix L1 L2} then true
   else
      case L2 
      of nil then false
      [] _|T2 then {FindString L1 T2}
      end
   end
end

%{Browse {Prefix [[d e f]] [a b c [d e f]]}}
{Browse {FindString [[d e f]] [a b c [d e f]]}}
