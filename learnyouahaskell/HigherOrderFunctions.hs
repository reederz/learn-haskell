-- simple function for us to practise currying
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- returns a partially applied (curried) compare function which needs one more
-- parameter to be fully applied
compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

-- partially applied infix function using "sections"
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- a function which takes a function as a parameter
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- more higher order functions (bloody hell, this is neat!)
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- takes a function and returns a function with first 2 args flipped
-- NB: second pair of brackets is unnecessary because -> is right associative
-- by default
flip' :: (a -> b -> c) -> b -> a -> c
flip' f = g
  where g x y = f y x

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs
