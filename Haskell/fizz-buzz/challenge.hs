module Main where

fizz :: String
fizz = "fizz"

buzz :: String
buzz = "buzz"

fizzbuzz :: Int -> String
fizzbuzz n 
    | (mod n 15) == 0 = fizz ++ buzz
    | (mod n 3) == 0 = fizz
    | (mod n 5) == 0 = buzz
    | otherwise = show n

main :: IO ()
main = 
    let answers = map fizzbuzz [1..100] 
    in mconcat (map putStrLn answers)
