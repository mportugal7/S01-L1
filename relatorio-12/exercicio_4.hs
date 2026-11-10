data Etapa = NaFila | NoBanho | Concluido
    deriving (Show, Eq)

data Atendimento = Atendimento {
    cliente :: String,
    servico :: String,
    valor :: Double,
    etapa :: Etapa
} deriving (Show)

descrever :: Atendimento -> String
descrever atendimento = "Cliente: " ++ cliente atendimento ++ " | Servico: " ++ servico atendimento ++ " | Etapa: " ++ show (etapa atendimento)

concluir :: Atendimento -> Atendimento
concluir atendimento =
    atendimento { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos = sum (map valor (filter (\atendimento -> etapa atendimento == Concluido) atendimentos))

main :: IO ()
main = do
    let atendimento1 = Atendimento "Sem Rosto" "Banho relaxante" 50.0 NaFila
    let atendimento2 = Atendimento "Rio Kohaku" "Banho especial" 80.0 NoBanho
    let atendimento3 = Atendimento "Deus do Rio" "Banho completo" 100.0 NaFila

    let atendimentos = [atendimento1, atendimento2, atendimento3]

    let atendimentosAtualizados = [
            concluir atendimento1,
            atendimento2,
            concluir atendimento3
            ]

    putStrLn "Atendimentos originais:"
    mapM_ (putStrLn . descrever) atendimentos

    putStrLn "\nArrecadado nos atendimentos originais:"
    print (arrecadado atendimentos)

    putStrLn "\nAtendimentos atualizados:"
    mapM_ (putStrLn . descrever) atendimentosAtualizados

    putStrLn "\nArrecadado nos atendimentos atualizados:"
    print (arrecadado atendimentosAtualizados)
