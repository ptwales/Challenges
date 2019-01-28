module Main where

import Data.List (intercalate)
import Control.Monad ((>=>))
import System.Directory as D
import System.Environment (getArgs)
import System.IO (FilePath)
import Text.Printf (printf)

data Path = File FilePath | Dir FilePath | DNE FilePath

check :: FilePath -> IO Path
check path = do
    isFile <- D.doesFileExist path 
    isDir <- D.doesDirectoryExist path
    return $
        if isFile then File path 
        else if isDir then Dir path
        else DNE path

ls :: FilePath -> IO ()
ls = check >=> ls'

ls' :: Path -> IO ()
ls' (Dir path) = D.listDirectory path >>= (putStrLn . intercalate "  ")
ls' (File path) = putStrLn path
ls' (DNE path) = printf "ls: cannot access '%s': No such file or directory\n" path

main :: IO ()
main = getArgs >>= parse
    
parse :: [String] -> IO ()
parse [] = ls "."
parse [path] = ls path
parse paths = 
 where
    filePaths = traverse check paths
    nested (Dir path) = do
        putStrLn (path ++ ":")
        ls' (Dir path)
        putStrLn ""
    nested path = ls' path


