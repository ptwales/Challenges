module Main where

import System.Environment

main :: IO ()
main = putStrLn . unwords =<< getArgs
    
