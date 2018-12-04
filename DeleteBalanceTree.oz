declare T = tree(key:horse value:cheval
              left:tree(key:dog value:chien
                            left:tree(key:cat value:chat left:leaf right:leaf)
                            right:tree(key:elephant value:elephant left:leaf right:leaf))
              right:tree(key:mouse value:souris
                               left:tree(key:monkey value:singe left:leaf right:leaf)
			 right:tree(key:tiger value:tigre left:leaf right:leaf)))

declare
fun {RemoveSmallest Tree}
   case Tree of leaf then none
   [] tree(key:Key value:Val left:Smaller right:Larger) then
      case {RemoveSmallest Smaller} of none then triple(Larger Key Val)
      [] triple(NewTree NewKey NewVal) then
	 triple(tree(key:Key value:Val left:NewTree right:Larger) NewKey NewVal)
      end
   end
end

fun {RemoveLargest Tree}
   case Tree of leaf then none
   [] tree(key:Key value:Val left:Smaller right:Larger) then
      case {RemoveLargest Larger} of none then triple(Smaller Key Val)
      [] triple(NewTree NewKey NewVal) then
	 triple(tree(key:Key value:Val left:Smaller right:NewTree) NewKey NewVal)
      end
   end
end

fun {Delete Key Tree}
   case Tree of leaf then leaf
   [] tree(key:X value:Val left:Smaller right:Larger) andthen X == Key then
      case {RemoveSmallest Larger} of none then Smaller
      [] triple(NewTree NewKey NewVal) then
	 tree(key:NewKey value:NewVal left:Smaller right:NewTree)
      end
   [] tree(key:X value:Val left:Smaller right:Larger) andthen X < Key then
      tree(key:X value:Val left:Smaller right:{Delete Key Larger})
   [] tree(key:X value:Val left:Smaller right:Larger) andthen X > Key then
      tree(key:X value:Val left:{Delete Key Smaller} right:Larger)
   end
end

fun {Delete2 Key Tree}
   case Tree of leaf then leaf
   [] tree(key:X value:Val left:Smaller right:Larger) andthen X == Key then
      case {RemoveLargest Smaller} of none then Larger
      [] triple(NewTree NewKey NewVal) then
	 tree(key:NewKey value:NewVal left:NewTree right:Larger)
      end
   [] tree(key:X value:Val left:Smaller right:Larger) andthen X < Key then
      tree(key:X value:Val left:Smaller right:{Delete Key Larger})
   [] tree(key:X value:Val left:Smaller right:Larger) andthen X > Key then
      tree(key:X value:Val left:{Delete Key Smaller} right:Larger)
   end
end

{Browse{Delete dog T}}
