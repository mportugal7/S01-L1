import java.util.ArrayList;

public class Cozinheiro {

    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;

        // COMPOSICAO: a Panela e criada dentro do Cozinheiro.
        // ela faz parte dele e nao e recebida como um objeto externo.
        this.panela = new Panela(materialDaPanela);

        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        // AGREGACAO: os monstros ja existem antes de serem adicionados.
        // o Cozinheiro apenas guarda referencias para esses objetos.
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("--- Banquete da Masmorra ---");
        System.out.println("Cozinheiro: " + nome);
        System.out.println("Material da panela: " + panela.getMaterial());

        for (Monstro monstro : ingredientes) {
            System.out.println(monstro.getNome() + ": " + monstro.receita());
        }
    }
}
