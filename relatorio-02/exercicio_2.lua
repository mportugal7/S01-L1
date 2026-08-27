function contarOcorrencias(tabela, alvo)
    local cont = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            cont = cont + 1
        end
    end
    return cont
end

print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())
local tabela = {}

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    tabela[i] = tonumber(io.read())
end

print("Digite o numero X a ser buscado:")
local X = tonumber(io.read())

local result = contarOcorrencias(tabela, X)
print("O numero " .. X .. " aparece " .. result .. " vez(es) na tabela.")
