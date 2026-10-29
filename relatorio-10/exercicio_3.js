class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nivel de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);

        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`\n--- Diario ${this.numero} ---`);

        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- Cabana do Misterio ---`);
        console.log(`Dono: ${this.dono}`);
        console.log("Funcionarios:");

        this.#funcionarios.forEach(funcionario => {
            console.log(`${funcionario.nome} - ${funcionario.cargo}`);
        });
    }
}
//main

const diario = new DiarioMisterioso(3);

diario.anotar("Gnomos", 4);
diario.anotar("Bebe do Tempo", 8);
diario.anotar("Bill Cipher", 10);

diario.exibirFichas();

const funcionario1 = new Funcionario("Dipper Pines", "Pesquisador");
const funcionario2 = new Funcionario("Mabel Pines", "Atendente");

const cabana = new CabanaDoMisterio("Stanley Pines");

cabana.contratar(funcionario1);
cabana.contratar(funcionario2);

cabana.abrirAsPortas();

//composicao: As fichas sao criadas dentro do metodo anotar() do diario, elas fazem parte da estrutura interna do diario.
//agregacao: Os funcionarios sao criados antes da cabana e depois adicionados a ela pelo metodo contratar(), eles podem continuar existindo independentemente da cabana.
