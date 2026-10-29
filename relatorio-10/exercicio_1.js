class Pokemon {
    #vida;//vida e privada

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida = this.#vida - pontos;

        if (this.#vida < 0) {
            this.#vida = 0;
        }

        console.log(`${this.apelido} ficou com ${this.#vida} de vida.`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} atacou ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Jato de Agua em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Chicote de Vinha em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}
//main

const squirtle = new Squirtle('Tartaruguinha', 50);
const bulbasaur = new Bulbasaur('Folhinha', 30);

bulbasaur.atacar(squirtle);

squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

//imprimindo a vida final usando getter
console.log(`\nVida final de ${squirtle.apelido}: ${squirtle.vida}`);
console.log(`Vida final de ${bulbasaur.apelido}: ${bulbasaur.vida}`);

//teste
// console.log(squirtle.#vida); //O programa nao executa enquanto essa linha estiver ativa.
