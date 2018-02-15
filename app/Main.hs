-- (from: https://github.com/bfops/open-union)

{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}

module Main where

import Data.OpenUnion

showMyUnion :: Union '[Char, Int, [()]] -> String
showMyUnion
    =  (\(c :: Char) -> "char: " ++ show c)
    @> (\(i :: Int) -> "int: " ++ show i)
    @> (\(l :: [()]) -> "list length: " ++ show (length l))
    @> (\(s :: String) -> "string: " ++ s)
    @> typesExhausted

main :: IO ()
main = do
    putStrLn $ showMyUnion $ liftUnion (4 :: Int)
    putStrLn $ showMyUnion $ liftUnion 'a'
    putStrLn $ showMyUnion $ liftUnion [(), ()]