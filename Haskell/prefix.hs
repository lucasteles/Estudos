main = do  

    putStrLn "uma palavra?"  

    p1 <- getLine  

    putStrLn "um prefixo?" 

    p2 <- getLine   

    putStrLn (if (prefix p2 p1) then "Sim" else "Não")  

 

 

test :: Integer -> [Integer] 

test 0 = []

test (n+1) =  final t ts  where (t:ts)=(n+1) : (test n) 

 

final :: Integer -> [Integer] -> [Integer]

final x (i:is) = i : final x is

final x [] = x:[]

 

 

prefix :: [Char] -> [Char] -> Bool 

prefix [] _ = True 

prefix _ [] = False

prefix (x:xs) (y:ys) = if (x==y) then prefix xs ys else False