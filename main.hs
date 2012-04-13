import Control.Monad
import System.IO

import Arr

main :: IO()
main = do
  putStrLn "Test."
  arr1 <- arrCreate
  arr2 <- arrCreate
  let narr1 = foldl (\a x -> arrWrite a x x) arr1 [0..10]
      narr2 = foldl (\a x -> arrWrite a x (10 -x)) arr2 [0..10]
  mapM_ (putStrLn . show . arrRead narr1) [0..10]
  mapM_ (putStrLn . show . arrRead narr2) [0..10]
  return ()
