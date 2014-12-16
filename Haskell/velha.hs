jogovelha = do
    let tab = ["123","456","789"]
    do iniciar 'P' tab "123456789"

iniciar  p tab jogo = do
    if (p =='P') 
    then (putStrLn "\n\n* PRETO * \n") 
    else (putStrLn "\n\n* BRANCO * \n") 

    putStrLn ( get_line tab 1)    
    putStrLn ( get_line tab 2)  
    putStrLn ( get_line tab 3)  

    j <- validarjogada jogo
    
    let jogo_n  = output j jogo
    let jn      = (read [j] :: Int) 
    let tab_n   = (jogada tab p jn)
    venc <- vencedor tab_n p

    if (isempty jogo_n || venc == 'P' || venc == 'B') then do{
        putStrLn ( "\n");
        putStrLn ( get_line tab_n 1);
        putStrLn ( get_line tab_n 2); 
        putStrLn ( get_line tab_n 3); 
        if(venc == 'V') 
        then (putStr "\n\nEmpate!")
        else do{
            putStr "\n\nJogador ";
            putStr ([venc]);
            putStr " Venceu!";
        }
    }
    else
        if (p == 'P') then (iniciar 'B' tab_n jogo_n ) else (iniciar 'P' tab_n jogo_n)

validarjogada jogo = do
    putStrLn ("\nPosicao 1 ate 9")
    j <- getChar
    if (isin j jogo)
    then (return(j))
    else do{
    putStrLn ("\nPosicao errada!\n");
    do validarjogada jogo;
    }

isempty :: [Char] -> Bool
isempty [] = True
isempty _  = False

isin :: Char -> [Char] -> Bool
isin _ [] = False
isin p (x:xs) = if (x == p) then (True) else (isin p xs)

output :: Char -> [Char] -> [Char]
output p (x:xs) = if (x == p) then (xs) else ([x] ++ output p xs)

get_line :: [String] -> Integer -> String
get_line (x:xs) n = tab (tab_line (x:xs) n) n
        
tab_line :: [String] -> Integer -> String
tab_line (x:xs) 1 = x  
tab_line (x:xs) n = (tab_line xs (n-1)) 
        
tab :: [Char] -> Integer -> [Char]
tab (x:xs) 1 = "   | ----- | ----- | ----- |\n"++linha(x:xs)
tab (x:xs) 3 = linha(x:xs)++"\n   | ----- | ----- | ----- |"
tab (x:xs) 2 = linha(x:xs)

linha :: [Char] -> [Char]
linha [] = "   |"
linha (x:xs) = "   |   " ++ (x:[]) ++ linha xs

marca :: [Char] -> Int -> Char -> [Char]
marca (x:xs) 0 p = [p] ++ xs
marca (x:xs) n p = x : marca xs (n-1) p
    
jogada :: [String] -> Char -> Int -> [String]
jogada [] _ _ =  []
jogada (x:xs) p n = (if ( n<=3 && n>0) then marca x (n-1) p else x) : (jogada xs p (n-3)) 

vencedor list v = do
    let v1 = vencedor1 list v 
    let v2 = vencedor2 list v 1
    let v3 = if((count (outc (outs list 1) 1 ++ outc (outs list 2) 2 ++ outc (outs list 3) 3) v)==3) then (v) else ('V')
    let v4 = if((count (outc (outs list 1) 3 ++ outc (outs list 2) 2 ++ outc (outs list 3) 1) v)==3) then (v) else ('V')
    
    if(v1 == v || v2 == v || v3 == v || v4 == v) then (return(v)) else (return('V'))

vencedor1 :: [String] -> Char -> Char
vencedor1 [] _     = 'V'
vencedor1 (x:xs) v = if((count x v) == 3) then (v) else (vencedor1 xs v)

vencedor2 :: [String] -> Char ->  Int -> Char
vencedor2 _ _ 4 = 'V'
vencedor2 (x:xs) v c = if((count (outc (outs (x:xs) 1) c ++ outc (outs (x:xs) 2) c ++ outc (outs (x:xs) 3) c) v)==3) then (v) else (vencedor2 (x:xs) v (c+1))

outs :: [String] -> Int -> [Char]
outs (x:[]) 1 = x
outs (x:xs) 1 = x
outs (x:xs) c = outs xs (c-1)

outc :: [Char] -> Int -> [Char]
outc [] _ = []
outc (x:[]) 1 = [x]
outc (x:xs) 1 = [x]
outc (x:xs) c = outc xs (c-1)

count :: [Char] -> Char -> Int
count [] _ = 0
count (x:xs) c = if(x==c) then ( 1 + count xs c) else (count xs c)

tochar :: [Char] -> Char
tochar [] = ' '
tochar (x:xs) = x