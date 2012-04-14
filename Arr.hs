module Arr (Arr, arrWrite, arrRead, arrCreate, arrSize) where

import Control.Arrow
import Foreign.C.Types
import Prelude hiding (read)

data Arr = Arr {getArrId :: CInt}

instance Show Arr where
  show = show . uncurry map . (arrRead &&& enumFromTo 0 . subtract 1 . arrSize)

foreign import ccall "arrCreate" create :: IO CInt
foreign import ccall "arrWrite" write :: CInt -> CInt -> CInt -> CInt
foreign import ccall "arrRead" read :: CInt -> CInt -> CInt
foreign import ccall "arrSize" size :: CInt -> CInt

arrWrite :: Arr -> Int -> Int -> Arr
arrWrite = ((Arr .) .) . flip flip fromIntegral . ((.) .) . (. fromIntegral) . write . getArrId

arrRead :: Arr -> Int -> Int
arrRead = curry $ fromIntegral . uncurry read . (getArrId *** fromIntegral) 

arrCreate :: IO Arr
arrCreate = create >>= return . Arr

arrSize :: Arr -> Int
arrSize = fromIntegral . size . fromIntegral . getArrId
