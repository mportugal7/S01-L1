#include <iostream>
#include <string>
using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    Banda(string n, int i, float p, int e) {
        nome = n;
        integrantes = i;
        potenciaSom = p;
        energia = e;
    }

    void duelar(Banda &rival) {
        cout << nome << " esta duelando contra " << rival.nome << "!" << endl;

        rival.energia = rival.energia - potenciaSom;
    }
};

int main() {
    Banda banda1("Legiao Urbana", 5, 20.0, 100);
    Banda banda2("Metallica", 4, 15.0, 100);

    banda1.duelar(banda2);

    cout << "\nSTATUS DAS BANDAS:" << endl;

    cout << "\nBanda: " << banda1.nome << endl;
    cout << "Integrantes: " << banda1.integrantes << endl;
    cout << "Potencia do som: " << banda1.potenciaSom << endl;
    cout << "Energia: " << banda1.energia << endl;

    cout << "\nBanda: " << banda2.nome << endl;
    cout << "Integrantes: " << banda2.integrantes << endl;
    cout << "Potencia do som: " << banda2.potenciaSom << endl;
    cout << "Energia: " << banda2.energia << endl;

    return 0;
}
