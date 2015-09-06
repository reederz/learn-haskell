-- Demonstrates pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

-- Example of recursive function
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Non-exhaustive pattern matching
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

-- pattern matching in list comprehensions
-- if patter matching fails, comprehension will just move to the next element
whateverxs = [(1, 3), (4, 3), (2, 4), (5, 3), (5, 6), (3, 1)]
whatever = [a+b | (a, b) <- whateverxs]

-- reimplement "head" with pattern matching
head' :: [a] -> a
head' [] = error "Can't call head on an empty list"
head' (x:_) = x

-- example of naming patterns
capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- example of "guards" in pattern matching
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"

-- example of inlining guards (shouldn't really use this because of poor readability)
max' :: (Ord a) => a -> a -> a
max' a b | a > b = a | otherwise = b


-- guards + infix notation
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

-- pattern matching, guards, and a new thing - "where" statement to minimize repetition
-- can also do pattern matching in where bindings like:
--where bmi = weight / height ^ 2
--      (skinny, normal, fat) = (18.5, 25.0, 30.0)
bmiTell1 :: (RealFloat a) => a -> a -> String
bmiTell1 weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0

-- defining functions in the "where" block
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2


-- similar to "where" bindings- "let" bindings
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

-- example of "case expressions"
describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."
