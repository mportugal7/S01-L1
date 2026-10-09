using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Especie} (Nivel {Nivel}) realizou um ataque generico!");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"{Especie} usou Chicote de Cipo!");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} soltou uma descarga eletrica!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new Pokemon("Eevee", 10));
        pokemons.Add(new TipoPlanta("Bulbasaur", 15));
        pokemons.Add(new TipoEletrico("Pikachu", 20));

        foreach (var pokemon in pokemons)
        {
            pokemon.Atacar();
        }
    }
}
