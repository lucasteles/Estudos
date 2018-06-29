module Velha where

import Data.List
import Data.List.Split
import Control.Monad.State

type Posicao = Int 
data Jogador = Bola | Cruz 

data Quadro = Quadro (Maybe Jogador) Posicao
type Tabuleiro = [Quadro]

data Jogada = Jogada Posicao deriving Show

type EstadoDoJogo = State (Jogador, Tabuleiro) (Jogador, Tabuleiro) 

instance Show Jogador where
    show Bola = "O"
    show Cruz = "X"

instance Show Quadro where
    show (Quadro Nothing a) = show (a+1)
    show (Quadro (Just j) _) = show j

exibirTabuleiro :: Tabuleiro -> String
exibirTabuleiro = concat 
                    . intersperse "\n" 
                    . map (unwords . intersperse "|" . map show) . chunksOf 3


replaceNth n newVal (x:xs)
     | n == 0 = newVal:xs
     | otherwise = x:replaceNth (n-1) newVal xs

criarTabuleiro = map (Quadro Nothing) [0..8]

proximoJogador Bola = Cruz
proximoJogador Cruz = Bola

marcar :: Tabuleiro -> Jogada -> Jogador -> Tabuleiro
marcar tab (Jogada index) jogador = replaceNth (index-1) (Quadro (Just jogador) index) tab

realizarJogada :: Jogada -> EstadoDoJogo
realizarJogada (Jogada onde) = do
    (jogador, tab) <- get
    let nTab = marcar tab (Jogada onde) jogador
    let proximo = proximoJogador jogador
    return (proximo, nTab)
    
podeJogar :: Jogada -> Tabuleiro -> Bool
podeJogar (Jogada onde) tab = case tab !! (onde-1) of
                                 Quadro (Just _)  _-> False
                                 Quadro (Nothing) _ -> True

venceu :: [Maybe Jogador] -> Bool
venceu ( Just Bola : Just Bola : Just Bola : _) = True 
venceu _ = False

jogoDaVelha = do
    putStrLn "Bem vindo ao jogo da velha"
    jogar (Cruz, criarTabuleiro)

jogar state@(jogador, tab) = do
    putStrLn $ exibirTabuleiro  tab
    putStrLn $ "Vez do " ++ show jogador ++ ":"
    ondeStr <- getLine 

    let onde = Jogada $ read ondeStr
    let jogadaValida = podeJogar onde tab

    if not jogadaValida then do 
        putStrLn "Jogada invalida"
        jogar state
    else do
        let jogada = realizarJogada onde 
        let novoState = evalState jogada state
        jogar novoState

    return ()

