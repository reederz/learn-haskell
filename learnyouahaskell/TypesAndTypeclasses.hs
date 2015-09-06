-- practising type declarations
removeNonUpperCase :: [Char] -> [Char]
removeNonUpperCase st = [c | c <- st, c `elem` ['A'..'Z']]

-- more type declarations- 3 input params, 1 return params
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
