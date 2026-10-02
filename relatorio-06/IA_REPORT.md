Mariana Novais Portugal - 746

*EXERCÍCIO 2*
- Histórico de Prompts: como funciona os metodos getters e setter em poo c++?  
- Resposta obtida: 
Claro! Vamos entender getters e setters em POO com C++ bem do começo, porque eles estão diretamente ligados ao conceito de encapsulamento.
1. Primeiro: por que existem getters e setters?
Imagine uma classe Pessoa:

class Pessoa {
private:
    string nome;
    int idade;
};

Os atributos nome e idade são private.
Isso significa que não podemos acessar diretamente esses atributos fora da classe:

Pessoa p;

p.nome = "Mariana"; // ERRO
p.idade = 20;       // ERRO

Então como conseguimos colocar e pegar esses valores?
É aí que entram:
Setter → coloca/altera um valor
Getter → pega/consulta um valor
2. Setter
O setter serve para alterar o valor de um atributo.

Por exemplo:

class Pessoa {
private:
    string nome;
    int idade;

public:
    void setNome(string nome) {
        this->nome = nome;
    }

    void setIdade(int idade) {
        this->idade = idade;
    }
};

Agora podemos fazer:

Pessoa p;

p.setNome("Mariana");
p.setIdade(20);
O que aconteceu?

Quando fazemos:

p.setNome("Mariana");

estamos chamando:

void setNome(string nome)

O "Mariana" entra no parâmetro:

string nome

E depois:

this->nome = nome;

coloca esse valor no atributo da classe.

3. Mas o que é esse this?

Essa parte costuma confundir bastante.

Temos:

private:
    string nome;

e:

void setNome(string nome)

Existem dois nome:
nome da classe       → atributo
nome do método       → parâmetro

Por isso usamos:

this->nome = nome;

O significado é:

this->nome
     ↑
atributo da classe

e:

nome
 ↑
parâmetro recebido

Então:

this->nome = nome;

significa:

"Coloque o valor recebido no atributo nome deste objeto."

4. Getter

O getter faz o contrário.

Ele serve para consultar/retornar o valor de um atributo.

Por exemplo:

string getNome() {
    return nome;
}

E:

int getIdade() {
    return idade;
}

Agora podemos fazer:

cout << p.getNome();
cout << p.getIdade();

O getter pega o valor que está dentro do objeto e devolve.

5. Classe completa

Juntando tudo:

#include <iostream>
#include <string>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:

    // SETTERS
    void setNome(string nome) {
        this->nome = nome;
    }

    void setIdade(int idade) {
        this->idade = idade;
    }

    // GETTERS
    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }
};

int main() {

    Pessoa p;

    // Alterando os atributos
    p.setNome("Mariana");
    p.setIdade(20);

    // Consultando os atributos
    cout << p.getNome() << endl;
    cout << p.getIdade() << endl;

    return 0;
}

Saída:

Mariana
20
6. Pense assim

Uma maneira bem simples de memorizar:

SET  → coloca
GET  → pega

Por exemplo:

p.setNome("Mariana");

é:

SET nome para "Mariana".

Enquanto:

p.getNome();

é:

GET o nome.

7. Por que não deixar o atributo public?

Poderíamos simplesmente fazer:

class Pessoa {
public:
    string nome;
    int idade;
};

E então:

Pessoa p;

p.nome = "Mariana";
p.idade = 20;

Funciona.

Mas isso permite que qualquer código altere os atributos diretamente.

Com:

private:
    string nome;
    int idade;

a classe consegue controlar como os dados são alterados.

Por exemplo, imagine que idade não possa ser negativa.

Podemos fazer:

void setIdade(int idade) {

    if (idade >= 0) {
        this->idade = idade;
    }
}

Agora:

p.setIdade(20);

funciona.

Mas:

p.setIdade(-50);

não altera a idade.

Isso é uma das ideias principais do encapsulamento.

8. Getter também pode ser usado dentro de expressões

Por exemplo:

if (p.getIdade() >= 18) {
    cout << "Maior de idade";
}

Aqui:

p.getIdade()

retorna um int.

Então é como se o programa tivesse:

if (20 >= 18)
9. Uma tabelinha para decorar
Método	Função	Exemplo
set	altera o atributo	p.setIdade(20)
get	retorna o atributo	p.getIdade()

Normalmente:

void setX(tipo valor) {
    this->x = valor;
}

e:

tipo getX() {
    return x;
}

Por exemplo, para altura:

void setAltura(double altura) {
    this->altura = altura;
}

double getAltura() {
    return altura;
}

Resumo mental:

private
   ↓
não acesso diretamente

setter
   ↓
ENTRA dado no objeto

getter
   ↓
SAI dado do objeto

Essa é a ideia central de getters e setters em POO.

Relatório de Aprendizado:
A dúvida estava relacionada ao funcionamento dos métodos getters e setters em C++. Compreendi que eles são utilizados para permitir o acesso controlado aos atributos private de uma classe. O setter é utilizado para modificar ou definir o valor de um atributo, enquanto o getter é utilizado para consultar e retornar esse valor. Dessa forma, os atributos continuam encapsulados dentro da classe.

*EXERCÍCIO 4*
- Histórico de prompts: fale um pouco sobre o override
- Resposta obtida: 
Claro! O override também é um conceito muito importante de POO em C++, principalmente quando começamos a trabalhar com herança e polimorfismo.

1. Primeiro: o que é override?

override significa, basicamente:

"Eu estou sobrescrevendo um método que já existe na classe pai."

Ou seja, temos uma classe pai com um método, e uma classe filha que cria uma versão própria desse mesmo método.

2. Exemplo bem simples

Imagine uma classe Animal:

class Animal {
public:
    virtual void emitirSom() {
        cout << "Som do animal" << endl;
    }
};

Temos um método:

emitirSom()

Agora criamos uma classe filha:

class Cachorro : public Animal {
public:
    void emitirSom() override {
        cout << "Au au!" << endl;
    }
};

Aqui:

void emitirSom() override

significa:

"A classe Cachorro está substituindo o método emitirSom() que veio de Animal."

3. Por que precisamos do virtual?

Essa parte é muito importante.

Na classe pai:

virtual void emitirSom() {
    cout << "Som do animal" << endl;
}

O virtual permite que o C++ escolha a versão correta do método de acordo com o objeto real.

Por exemplo:

Animal* animal;

Cachorro cachorro;

animal = &cachorro;

animal->emitirSom();

Mesmo a variável sendo:

Animal*

o objeto que está realmente sendo apontado é:

Cachorro

Então será chamado:

Au au!

Isso é polimorfismo.

4. E o override?

Agora vem a parte interessante.

Poderíamos escrever:

class Cachorro : public Animal {
public:
    void emitirSom() {
        cout << "Au au!" << endl;
    }
};

Isso pode funcionar.

Mas é muito melhor escrever:

class Cachorro : public Animal {
public:
    void emitirSom() override {
        cout << "Au au!" << endl;
    }
};

Porque o override diz ao compilador:

"Eu quero sobrescrever um método da classe pai. Se esse método não existir ou a assinatura estiver errada, me avise."

5. Exemplo de erro que o override ajuda a encontrar

Imagine que na classe pai temos:

class Animal {
public:
    virtual void emitirSom() {
        cout << "Som" << endl;
    }
};

E você escreve na filha:

class Cachorro : public Animal {
public:
    void emitirSons() override {
        cout << "Au au!" << endl;
    }
};

Percebe o problema?

Na classe pai:

emitirSom()

Na filha:

emitirSons()
          ↑

Tem um s a mais.

Sem override, o C++ pode interpretar isso como um método novo, e você pode não perceber o erro.

Com:

void emitirSons() override

o compilador reclama, porque:

"Você disse que está sobrescrevendo um método, mas não existe esse método com essa assinatura na classe pai."

Isso é uma das grandes utilidades do override.

6. override NÃO cria herança

Uma confusão comum:

void emitirSom() override

não significa que o método está sendo herdado.

A herança acontece aqui:

class Cachorro : public Animal

O override apenas informa:

"Esse método da classe filha está substituindo um método virtual da classe pai."

7. Exemplo com vários animais

Podemos fazer:

#include <iostream>

using namespace std;

class Animal {
public:

    virtual void emitirSom() {
        cout << "Som do animal" << endl;
    }
};

class Cachorro : public Animal {
public:

    void emitirSom() override {
        cout << "Au au!" << endl;
    }
};

class Gato : public Animal {
public:

    void emitirSom() override {
        cout << "Miau!" << endl;
    }
};

int main() {

    Cachorro cachorro;
    Gato gato;

    cachorro.emitirSom();
    gato.emitirSom();

    return 0;
}

Saída:

Au au!
Miau!

Cada classe filha possui sua própria versão de emitirSom().

8. Onde entra o polimorfismo?

Agora podemos fazer algo mais interessante:

Animal* animal;

Cachorro cachorro;
Gato gato;

animal = &cachorro;
animal->emitirSom();

animal = &gato;
animal->emitirSom();

Resultado:

Au au!
Miau!

Mesmo usando:

Animal*

o C++ chama o método correspondente ao objeto.

Visualmente:

             Animal
                |
          emitirSom()
                |
        ----------------
        |              |
     Cachorro         Gato
        |              |
    emitirSom()    emitirSom()
      "Au au!"       "Miau!"

Isso é a combinação de:

herança + virtual + override → polimorfismo.

9. Diferença entre virtual e override

Essa diferença é MUITO importante para prova:

Na classe pai:
virtual void emitirSom();

virtual diz:

"Esse método pode ser sobrescrito pelas classes filhas."

Na classe filha:
void emitirSom() override;

override diz:

"Eu estou sobrescrevendo o método virtual da classe pai."

Então:

PAI:
virtual
   ↓
permite sobrescrita

FILHA:
override
   ↓
confirma sobrescrita
10. Uma comparação com getter/setter

Como você acabou de perguntar sobre getters e setters, dá para separar bem:

Getter/setter

Servem principalmente para encapsulamento:

private:
    int idade;

public:
    void setIdade(int idade);
    int getIdade();
Override

Serve para herança/polimorfismo:

class Animal {
public:
    virtual void emitirSom();
};

class Cachorro : public Animal {
public:
    void emitirSom() override;
};

Então pense:

GETTER / SETTER
      ↓
ENCAPSULAMENTO


VIRTUAL / OVERRIDE
      ↓
HERANÇA + POLIMORFISMO

E uma observação importante: override só pode ser usado quando realmente existe um método virtual compatível na classe base. Ele não é simplesmente uma palavra para "mudar um método".

Relatório de Aprendizado:
Entendi que override é usado em uma classe filha para sobrescrever um método da classe base, permitindo que a filha tenha seu próprio comportamento para esse método.
