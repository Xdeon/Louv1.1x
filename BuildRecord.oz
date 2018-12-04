declare

% L contains 3 elements
% [Label ListofFieldNames ListofFieldValues]
% and can be defined recursively (in ListofFieldValues)

fun {Transform L}
   local Helper in
      fun {Helper Fields Values Acc}
	 case Fields
	 of nil then Acc
	 [] Field|FieldTails then
	    local Val ValTails in
	       Val|ValTails = Values
	       case Val
	       of _|_ then
		  Acc.Field = {Transform Val}
		  {Helper FieldTails ValTails Acc}
	       else
		  Acc.Field = Val
		  {Helper FieldTails ValTails Acc}
	       end
	    end
	 end
      end
      local Label=L.1 Fields=L.2.1 Values=L.2.2.1 in
	 {Helper Fields Values {Record.make Label Fields}}
      end
   end	    
end

{Browse {Transform [test [a b c] [1 2 [nested [d e] [3 [another [f] [5]]]]]]}}
      
      
	 