import Data.Monoid

addTwo :: Int -> Int -> Int 
addTwo a b = a + b 

addThree a b c = a + b : c 


addFour a b c d = d + ( addThree a b c  )
