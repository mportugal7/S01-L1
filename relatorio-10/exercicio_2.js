class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(
            `O agente ${this.codinome} deve implementar usarHabilidade()`
        );
    }

    entrarEmCombate() {
        console.log(
            `${this.codinome} esta usando a pistola ${this.#pistola.modelo}.`
        );

        console.log(this.usarHabilidade());
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return `${this.codinome} usa uma cortina de fumaca para bloquear a visao dos inimigos!`;
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return `${this.codinome} usa uma habilidade para localizar os inimigos!`;
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return `${this.codinome} avanca para enfrentar os inimigos!`;
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n--- Esquadrao ${this.nome} iniciou a partida! ---`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(
            agente => agente instanceof Controlador
        );
    }
}
//main

//cria os agentes antes do esquadrao
const omen = new Controlador('Omen', 'Ghost');
const viper = new Controlador('Viper', 'Sheriff');
const sova = new Iniciador('Sova', 'Classic');
const jett = new Duelista('Jett', 'Frenzy');

//cria o esquadrao com os agentes que ja existem
const esquadrao = new Esquadrao(
    'Protocolo Alfa',
    [omen, viper, sova, jett]
);

esquadrao.iniciarPartida();

console.log('\nControladores do esquadrao:');

esquadrao.listarControladores().forEach(agente => {
    console.log(agente.codinome);
});

//teste

const agenteTeste = new AgenteProtocolo('Agente Generico', 'Classic');

// agenteTeste.entrarEmCombate();//esta chamada gera um erro porque usarHabilidade() nao foi sobrescrito.
