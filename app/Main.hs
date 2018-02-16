module Main where

import qualified OfficialExample  
import qualified SimplePrac
import qualified RistrictPrac


main :: IO ()
main = do
  putStrLn ("=============== OfficialExample ===============")
  OfficialExample.main
  putStrLn ("=============== SimplePrac ===============")
  SimplePrac.main
  putStrLn ("=============== RistrictPrac ===============")
  RistrictPrac.main
