module Lib
    ( day4Answer
      ,sumSectorIds
      ,testRealRoom
      ,parseName
      ,frequency
      ,getChecksum
      ,getChecksum'
      ,shiftCipher
      ,decryptName
    ) where

import Data.List
import Data.List.Split

sumSectorIds :: String -> Int
sumSectorIds contents = do
  let contentLines = lines contents
  foldr (\y acc -> acc + (testRealRoom y)) 0 contentLines


day4Answer :: IO ()
day4Answer = do
  contents <- readFile "input.txt"
  let answer = sumSectorIds contents
  putStrLn $ "day4 part a: " ++ show answer
  let answer2 = map (\line -> decryptName line ) (lines contents)
  putStrLn  "day4 part b: " 
  mapM_ print answer2

testRealRoom :: [Char] -> Int
testRealRoom str = do
  let (name, sector, checksum) = parseName str
  let answer = take 5 $ getChecksum name
  if answer==checksum
  then read sector
  else 0

parseName :: [Char] -> ([Char], [Char], [Char])
parseName str = do
  let [longname, checkSum] = splitOn "[" str
  let name = tail $ dropWhile (/='-') $ reverse longname
  let sector = reverse $ takeWhile (/='-') $ reverse longname
  (reverse $ name, sector, init checkSum)

frequency :: Ord a => [a] -> [(a, Int)]
frequency str = map (\x -> (head x, length x)) $ group $ sort str

sortGT :: (Ord a1, Ord a) => (a1, a) -> (a1, a) -> Ordering
sortGT (a1, b1) (a2, b2)  
  | b1 > b2 = LT 
  | b1 < b2 = GT 
  | b1 == b2 = compare a1 a2 

getChecksum :: [Char] -> [Char]
getChecksum str = map (\(y,_) -> y) $ getChecksum' str

getChecksum' :: [Char] -> [(Char, Int)]
getChecksum' str = Data.List.sortBy sortGT $ frequency $ filter (/='-') str


--shiftCipher :: Char -> Int -> Char
shiftCipher c  places = do
    let key = ['a'..'z']
    let idx = elemIndex c key
    if c=='-' then ' ' else do
      let el = case idx of
                Just value ->  key!!((value+places) `mod` 26)
                Nothing -> error "invalid char"
      el

decryptName :: [Char] -> [Char]
decryptName str = do
  let (name, sector, checksum) = parseName str
  map (\y -> shiftCipher y (read sector) ) name 
    

