using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }

    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine("\nNome: " + Nome);
        Console.WriteLine("Povo: " + Povo);
        Console.WriteLine("Posto: " + Posto);

        if (Armamento != "Desarmado")
        {
            Console.WriteLine("Armamento: " + Armamento);
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        CombatenteDeGondor combatente1 =
            new CombatenteDeGondor("Boromir", "Gondor", "Capitao");

        CombatenteDeGondor combatente2 =
            new CombatenteDeGondor("Faramir", "Gondor", "Comandante");

        CombatenteDeGondor combatente3 =
            new CombatenteDeGondor("Beregond", "Gondor", "Soldado");

        combatente1.Equipar("Espada");
        combatente3.Equipar("Lanca");

        combatente1.ApresentarUnidade();
        combatente2.ApresentarUnidade();
        combatente3.ApresentarUnidade();
    }
}
