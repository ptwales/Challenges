module Main where

import Control.Monad ((>=>))
import System.IO (readFile)
import System.Environment (getArgs)

main :: IO ()
main = getArgs >>= mapM_ (readFile >=> putStrLn)  
