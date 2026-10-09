using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"\nEntidade: {Nome}");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        Console.WriteLine($"\nO Profundo {Nome} emergiu das profundezas!");
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"{Nome} emitiu um som estranho!");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\nCatalogo do pesquisador {Nome}:");

        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        EntidadeCosmica entidade1 =
            new EntidadeCosmica("Cthulhu");

        Profundo entidade2 =
            new Profundo("Dagon");

        MiGo entidade3 =
            new MiGo("Mi-Go de Yuggoth");

        entidade1.Origem = "R'lyeh";

        Pesquisador pesquisador =
            new Pesquisador("Henry Armitage");

        pesquisador.Catalogar(entidade1);
        pesquisador.Catalogar(entidade2);
        pesquisador.Catalogar(entidade3);

        pesquisador.LerCatalogo();
    }
}
