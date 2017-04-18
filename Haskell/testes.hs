-- onme line comment

{-
	block 
	comment
-}

import Data.List
import System.IO

-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer NOT BOUNDED
--other types : Float, Double, Bool, Char, Tuple


aways5 :: Int
aways5 = 5


sumOfNums = sum [1..1000]

base_operations = 1 + 1 - 1 * 1 / 1

-- suffix 
modEx = mod 5 4

-- infix
modEx2 = 5 `mod` 4

-- obrigatorio uso de parenteses em operacoes com negativo
negNumEx = 5 + (-4)


num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9)


-- math functions 
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9  = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999

boolOperations = True || False && True

-- :t (+)




-- LISTS 


primeNumbers = [3,5,7,11]

morePrimes = primeNumbers ++ [13,17,19,23]

favNums = 2 : 7 : 21 : []

multList = [ [1,2,3], [4,5,6] ]

morePrimes2 = 2 : morePrimes

lenPrime = length morePrimes2 

revPrime = reverse morePrimes2

isListEmpty = null morePrimes2

secondPrime = morePrimes2 !! 1

firstPrime = head morePrimes2

lastPrime = last morePrimes2

initPrime = init morePrimes2

first3Primes = take 3 morePrimes2

removedPrimes = drop 3 morePrimes2

is7inList = 7 `elem` morePrimes2

maxPrime = maximum morePrimes2
minPrime = minimum morePrimes2



newList = [2,3,5]
prod = product newList

evenList = [2,4..20]


letterList = ['A','C'..'Z']

infinityPow10 = [10,20..]

many2 = take 10 (repeat 2)

many3 = replicate 10 3

cycleList = take 10 (cycle [1,2,3])

listTimes2 = [x * 2 | x <- [1..10]]

listTimes3 = [x * 3 | x <-[1..20], x*3 <= 50]

divBy9or13 = [ x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]


sortedList = sort [5,6,8,2,3,6,8]

sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]

listBiggerThen5 = filter (>5) morePrimes2

evensUpTo20 = takeWhile (<= 20) [2,4..]

multOfList = foldl (*) 1 [2,3,4,5]

pow3List = [3^n | n <- [1..10]]

multTavle = [[x * y | y <- [1..10]] | x <- [1..10]]



-- TUPLES

randTuple = (1, "valor")

tupleItem1 = fst randTuple
tupleItem2 = snd randTuple

names = ["jose", "maria", "mane"]
adresses = ["rua ab", "avenida x", "rua z"]
namesAndAdresses = zip names adresses




-- Functions

getTriple x = x * 3

--funcName param1 param2 = operations (returned values)
addMe :: Int -> Int -> Int
addMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)


whatAge :: Int -> String
whatAge 16 = "You can vote"
whatAge 18 = "You can drive"
whatAge 21 = "You are an adult"
whatAge x = "Nothing important"


factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

testGuards :: Int -> String
testGuards age
	| (age >= 5) && (age <=13) = "criança"
	| (age > 13) && (age <=17) = "adolecente"
	| (age > 17)  = "adulto"
	| otherwise = "bebe"




headshotsRating hits atHeads
	| avg <= 0.200 = "noob"
	| avg <= 0.250 = "normal player"
	| avg <= 0.280 = "above average"
	| otherwise = "you RULE"
	where avg = hits / atHeads



getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list contains " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The first item is " ++ show x ++ " and the rest are " ++ show xs


getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]



times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4]


multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs



areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False


doMult :: (Int -> Int) -> Int
doMult func = func 3
  
num3Times4 = doMult times4
 


getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y

adds3 = getAddFunc 3   
fourPlus3 = adds3 4


-- lambdas

dbl1To10 = map (\x -> x * 2) [1..10]


-- Every if statement must contain an else
doubleEvenNumber y = 
	if (y `mod` 2 /= 0)
		then y
		else y * 2
							

-- We can use case statements 
getClass :: Int -> String
getClass n = case n of
	5 -> "Go to Kindergarten"
	6 -> "Go to elementary school"
	_ -> "Go some place else"




-- modules
--import SampleFunctions

data Fruits = Orange
		| Apple
		| Strawberry
		| Banana
	deriving Show


brazilian :: Fruits -> Bool
brazilian Banana = True
 
bananaIn = (brazilian Banana)





data Customer = Customer String String Double
	deriving Show


-- Define Customer and its values
tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main St" 20.50
		 
 -- Define how we'll find the right customer (By Customer) and the return value
getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b
	

tomSmithBal =  (getBalance tomSmith)



data RPS = Rock | Paper | Scissors
 
shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Beats Rock"
shoot Rock Scissors = "Rock Beats Scissors"
shoot Scissors Paper = "Scissors Beat Paper"
shoot Scissors Rock = "Scissors Loses to Rock"
shoot Paper Scissors = "Paper Loses to Scissors"
shoot Rock Paper = "Rock Loses to Paper"
shoot _ _ = "Error"



data Shape = Circle Float Float Float 
		| Rectangle Float Float Float Float
		deriving Show
	 
area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs (x2 - x)) * (abs (y2 -y))


areaOfCircle = area (Circle 50 60 20)
areaOfRectangle = area $ Rectangle 10 10 100 100


-- sumValue = putStrLn (show (1 + 2)) becomes
sumValue = putStrLn . show $ 1 + 2


