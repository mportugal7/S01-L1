class Persona:

    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona: {self.nome} | Arcano: {self.arcano}")


class Aliado:

    def __init__(self, nome, codinome):
        self.nome = nome
        self.codinome = codinome


class Lider:

    def __init__(self, codinome):
        self.codinome = codinome

        self.persona = Persona("Arsene", "Louco")

        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)

    def infiltrar(self, palacio):
        print(f"\nPalacio de {palacio} invadido!")

        self.persona.invocar()

        print("\nEquipe dos Phantom Thieves:")

        for aliado in self._equipe:
            print(f"Nome: {aliado.nome} | Codinome: {aliado.codinome}")

            
aliado1 = Aliado("Ryuji Sakamoto", "Skull")
aliado2 = Aliado("Ann Takamaki", "Panther")

lider = Lider("Joker")

lider.recrutar(aliado1)
lider.recrutar(aliado2)

lider.infiltrar("Kamoshida")
