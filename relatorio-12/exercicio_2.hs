pesoMaximo :: Double
pesoMaximo = 10.0

-- pesoMaximo = 15.0

data Encomenda = Encomenda {
    destinatario :: String,
    peso :: Double,
    frete :: Double
} deriving (Show)

descrever :: Encomenda -> String
descrever encomenda =
    "Destinatario: " ++ destinatario encomenda ++
    " | Peso: " ++ show (peso encomenda) ++ " kg" ++
    " | Frete: R$ " ++ show (frete encomenda)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas =
    filter (\encomenda -> peso encomenda <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas =
    sum (map frete encomendas)

main :: IO ()
main = do
    let encomendas = [
            Encomenda "Tombo" 5.0 15.0,
            Encomenda "Osono" 8.0 20.0,
            Encomenda "Ursula" 12.0 25.0,
            Encomenda "Madame" 15.0 30.0
            ]

    putStrLn "Todas as encomendas:"
    mapM_ (putStrLn . descrever) encomendas

    putStrLn "\nEncomendas que cabem na vassoura:"
    mapM_ (putStrLn . descrever) (cabemNaVassoura encomendas)

    putStrLn "\nTotal de fretes das encomendas que cabem:"
    print (totalDeFretes (cabemNaVassoura encomendas))
