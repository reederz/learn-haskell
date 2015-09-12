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

Types and Typeclasses
=====================
- static type system
- type inference
- :t command in ghci to get type of variable
- it's best to give explicit type declarations to all the functions
- if unsure about type declaration of a function, you can write it without it and use :t on it
- Some types: Int, Integer, Float, Double, Bool, Char
- Int vs Integer : bounded vs unbounded
- Type variables are used to indicate that any type can be used for variable (polymorphic functions)

Syntax in Functions
===================
- most of the stuff is in SyntaxInFunctions.hs
- difference between *where* and *let* bindings - *where* is just syntactic sugar, whereas *let* is an expression which you can use anywhere (just like if/then/else)


Recursion
=========
- recursion is important in haskell because it's declarative (we don't have loops) and repetitive functions have to be defined in terms of themselves
- we can use recursion to produce infinite data structures (E.g. infine list). This is OK in haskell because it's lazy and it only goes as far as it absolutely needs to. So you can pass an infinite data structure to a function which "cuts off" a finite part of it and your program will be just fine.

Higher order functions
======================
- higher order function is a function which takes a function as a parameter or returns a function
- all functions in Haskell take in only 1 parameter. Multiple parameters are supported by means of "currying" (series of partial applications of functions)
- lambdas are anonymous functions which you only want to use once (usually as a parameter of a higher order function)
- you can pattern match in lambdas but you can't define several patterns for 1 parameter, so be careful not to fall through the patterns because it can result in an error
- scanl and scanr are like foldl and foldr, only they report all the intermediate accumulator states in the form of a list.
- $ - function application. It makes function application "left associative" and it sometimes makes sense to use it for readability purposes E.g. sqrt $ 4 + 10 + 2  is the same as sqrt (4 + 10 + 2) and results in 4. Whereas sqrt 4 + 10 + 2 adds 10 and 2 and sqrt of 4 (right associative) which results in 14.
- we can use . (dot) to do function composition in haskell. E.g. negate . (+3)
  returns a function which add 3 to a number and then negates it
