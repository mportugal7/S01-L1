#include <iostream>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) 
{
    float confiabilidade = 1.0;

    for (int i = 0; i < tamanho; i++) 
    {
        confiabilidade = confiabilidade * probabilidades[i];
    }

    return confiabilidade;
}

int main() 
{
    int n;

    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    float probabilidades[n];

    for (int i = 0; i < n; i++) 
    {
        cout << "Digite a probabilidade do componente " << i + 1 << ": ";
        cin >> probabilidades[i];
    }

    float total = calcular_confiabilidade_sistema(probabilidades, n);

    cout << "Confiabilidade total do sistema: " << total;
    cout << " (" << total * 100 << "%)" << endl;

    return 0;
}
