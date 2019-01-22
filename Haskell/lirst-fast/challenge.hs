module Main where

import Control.Monad (void)
import System.IO (hFlush, stdout)
import Text.Printf (printf)

pig :: String -> String -> String
pig first last = (head last) : (tail first)

prompt :: IO ([String])
prompt = do
    putStr "What is your full name? "
    hFlush stdout
    line <- getLine
    return (words line)

data State = State { quit :: Bool, wrong :: Int }

start :: State
start = State { quit = False, wrong = 0 }

exit :: State
exit = State { quit = True, wrong = 0 }

handle :: State -> IO (State)
handle state = prompt >>= \ws -> case ws of
    [":q"] -> -- TODO: merge these two
        return exit
    [":quit"] -> 
        return exit
    first : last : [] -> 
        let lirst = pig first last
            fast = pig last first
            next = state { wrong = 0 }
        in putStrLn (lirst ++ " " ++ fast) >> return next
    badWords -> 
        let wordCount = length badWords
            name = unwords badWords
            wrongInc = wrong state + 1
            next = state { wrong = wrongInc }
        in do
            printf "%s has %d words instead of only 2: attempt %d\n" name wordCount wrongInc
            return next

run :: Monad m => (State -> m State) -> State -> m State
run handle state = do 
    next <- handle state
    if quit next 
        then return next 
        else run handle next
    
main :: IO ()
main = void $ run handle start
