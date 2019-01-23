module Main where

import System.Environment (getArgs)

touch :: String -> IO ()
touch = flip writeFile ""

main :: IO ()
main = getArgs >>= mapM_ touch
