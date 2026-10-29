class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} realiza um ataque generico de aura contra ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} usa um golpe de força intensificada contra ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma sua aura em eletricidade e ataca ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializa uma corrente e ataca ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`\nAranhas avistadas em ${this.cidade}:`);

        this.#aranhas.forEach(aranha => {
            console.log(`Numero ${aranha.numero} - ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}
//main

const aranha1 = new Aranha("Chrollo Lucilfer", 0);
const aranha2 = new Aranha("Feitan Portor", 2);

const trupe = new TrupeFantasma("Yorknew", [aranha1, aranha2]);

trupe.revelarAranhas();

const alvo = trupe.buscarAranha(2);

const gon = new Intensificador("Gon Freecss");
const killua = new Transmutador("Killua Zoldyck");
const kurapika = new Materializador("Kurapika");

const usuarios = [gon, killua, kurapika];

console.log("\n--- Hunters iniciam o combate! ---");

usuarios.forEach(usuario => {
    usuario.atacar(alvo);
});
