data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco intensidade) =
    nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe nome preco intensidade)
    | intensidade >= 8 = "Forte"
    | intensidade >= 5 = "Equilibrado"
    | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido pediuLeite (Cafe nome preco intensidade) =
    if pediuLeite
        then preco + 2.0
        else preco

main :: IO ()
main = do
    let cafe1 = Cafe "Cafe Arabica" 8.50 3
    let cafe2 = Cafe "Cafe Colombiano" 10.00 6
    let cafe3 = Cafe "Cafe Intenso" 12.00 9

    putStrLn (descrever cafe1)
    putStrLn (forca cafe1)

    putStrLn (descrever cafe2)
    putStrLn (forca cafe2)

    putStrLn (descrever cafe3)
    putStrLn (forca cafe3)

    putStrLn "Preco do Cafe Colombiano com leite:"
    print (precoDoPedido True cafe2)

    putStrLn "Preco do Cafe Colombiano sem leite:"
    print (precoDoPedido False cafe2)
