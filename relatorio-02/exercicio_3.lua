function filtrarMaiores(tabela, limite)
    local tabela2 = {}
    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(tabela2, tabela[i])
        end
    end
    return tabela2
end

print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())
local tabela = {}

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    tabela[i] = tonumber(io.read())
end

print("Digite o valor limite (K):")
local K = tonumber(io.read())

local result = filtrarMaiores(tabela, K)
print("--- Elementos maiores que " .. K .. " ---")
for i = 1, #result do
    print(result[i])
end
