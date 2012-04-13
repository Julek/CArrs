module Arr where

import Foreign.C.Types
import Prelude hiding (read)

data Arr = Arr CInt

foreign import ccall "arrWrite" write :: CInt -> CInt -> CInt -> CInt
foreign import ccall "arrRead" read :: CInt -> CInt -> CInt
foreign import ccall "arrCreate" create :: IO CInt

arrWrite :: Arr -> Int -> Int -> Arr
arrWrite (Arr n) = ((Arr .)  .) $ (. fromIntegral ) . write n . fromIntegral

arrRead :: Arr -> Int -> Int
arrRead (Arr n) = fromIntegral . (. fromIntegral) read n . fromIntegral

arrCreate :: IO Arr
arrCreate = create >>= return . Arr
