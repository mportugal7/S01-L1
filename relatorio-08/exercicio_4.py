from abc import ABC, abstractmethod

class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:

    def __init__(self, modelo):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome, modelo):
        self.nome = nome

        self.cyberdeck = Cyberdeck(modelo)

    def executar_invasao(self):
        print(
            f"Netrunner {self.nome}, usando o cyberdeck "
            f"{self.cyberdeck.modelo}, esta quebrando o gelo (ICE) "
            f"de um servidor."
        )


class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} esta interceptando o sinal da rede.")

class CelulaHacker:

    def __init__(self, nome, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"\nCelula hacker {self.nome} iniciando ataque!")

        for membro in self.membros:
            membro.executar_invasao()


netrunner = OperadorNetrunner("V", "Arasaka Mk.5")
drone = DroneDeVigilancia("D-07")

celula = CelulaHacker("Fantasma", [netrunner, drone])

celula.iniciar_ataque()
