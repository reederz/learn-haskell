Introduction
============
- ghc - compiler
- ghci - interactive shell
- :l <scriptname> loads functions from external file
- :r to reload the current script

Starting Out
============
- Strings are just syntactic sugar for lists of characters
- ++ concatenates lists
- : (cons) puts an element in front of list
- !! addresses element in a list by number
- head(last), init(tail), length, null(is empty?), reverse, take(drop), maximum(minimum), sum, product, elem (check existance)
- [1..20] - inclusive range from 1 to 20
- [1, 3..20] - range with step. Results in [1,3,5,7,9,11,13,15,17,19]
- cycle - take a list and cycle it into infinite list
- repeat - like cycle but takes 1 element
- [x * 2 | x <- [1..10], x*2 >= 12] - list comprehension which doubles first 10 natural numbers but drops every double less than 12
- tuples have fixed number of elements. The elements can have different types
- a set of all right triangles with perimeter of 24:
  let rightTriangles24 = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
