{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}


module RistrictPrac where

import Data.OpenUnion
import Data.Either.Combinators (rightToMaybe)


myMul :: Union '[Int, Bool, Char] -> Union '[(), Int] -> Maybe Int
myMul x y = do
    i  <- rightToMaybe (restrict x)
    j  <- rightToMaybe (restrict y)
    return (i * j)


main :: IO ()
main = do

    let intOrBoolOrChar1 = liftUnion (4 :: Int) :: Union '[Int, Bool, Char]
    let unitOrInt1       = liftUnion (3 :: Int) :: Union '[(), Int]
    let charEither :: Either (Union '[Bool, Char]) Int
        charEither = restrict intOrBoolOrChar1

    print charEither
    -- => Right 4

    print (myMul intOrBoolOrChar1 unitOrInt1)
    -- => Just 12

