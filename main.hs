import Control.Monad
import System.IO

import Arr

main :: IO()
main = do
  arr1 <- arrCreate
  arr2 <- arrCreate
  let narr1 = foldl (\a x -> arrWrite a x x) arr1 [0..10]
      narr2 = foldl (\a x -> arrWrite a x (10 -x)) arr2 [0..10]
  print narr1
  print narr2
  return ()
