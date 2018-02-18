{-# LANGUAGE DataKinds #-}

module SimplePrac where

import Data.OpenUnion


main :: IO ()
main = do
    let charOrInt1 :: Union '[Char, Int]
        charOrInt1 = liftUnion (35 :: Int)
    print charOrInt1
    -- => Union (35 :: Int)

    let charOrInt2 :: Union '[Char, Int]
        charOrInt2 = liftUnion 'j'
    print charOrInt2
    -- => Union ('j' :: Char)

    let charOrIntOrBool1 :: Union '[Char, Int, Bool]
        charOrIntOrBool1 = reUnion charOrInt1
    print charOrIntOrBool1
    -- => Union (35 :: Int)

    -- (NOTE: order of types is different)
    let intOrBoolOrChar1 :: Union '[Int, Bool, Char]
        intOrBoolOrChar1 = reUnion charOrInt1
    print intOrBoolOrChar1
    -- => Union (35 :: Int)

    let hList1 :: [ Union '[Maybe Bool, String, ()] ]
        hList1 = [ liftUnion "apple"
                 , liftUnion (Just True)
                 , liftUnion ()
                 , liftUnion "orange"
                 , liftUnion (Nothing :: Maybe Bool)
                 ]
    print hList1
    -- => [Union ("apple" :: [Char]),Union (Just True :: Maybe Bool),Union (() :: ()),Union ("orange" :: [Char]),Union (Nothing :: Maybe Bool)]
