data Esboco = Esboco {
    titulo :: String,
    tecnica :: String,
    horas :: Int
} deriving (Show)

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio!"
esbocoMaisRecente (e:_) =
    titulo e ++ " - Tecnica: " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) =
    1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) =
    horas e + horasDesenhando resto

main :: IO ()
main = do
    let caderno = [
            Esboco "Dragao" "Nanquim" 3,
            Esboco "Castelo Abandonado" "Grafite" 2,
            Esboco "Floresta Sombria" "Carvao" 4
            ]

    putStrLn "Esboco mais recente:"
    putStrLn (esbocoMaisRecente caderno)

    putStrLn "Quantidade de esbocos:"
    print (contarEsbocos caderno)

    putStrLn "Total de horas desenhando:"
    print (horasDesenhando caderno)

    putStrLn "\nEsboco mais recente do caderno vazio:"
    putStrLn (esbocoMaisRecente [])

    let novoCaderno = Esboco "Cavaleiro" "Grafite" 5 : caderno

    putStrLn "\nCaderno anterior:"
    putStrLn (esbocoMaisRecente caderno)
    print (contarEsbocos caderno)

    putStrLn "\nNovo caderno:"
    putStrLn (esbocoMaisRecente novoCaderno)
    print (contarEsbocos novoCaderno)

    -- print (titulo (head []))
