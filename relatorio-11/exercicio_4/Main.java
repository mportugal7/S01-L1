public class Main {
    public static void main(String[] args) {

        Slime slime = new Slime("Slime Azul");
        Mandragora mandragora = new Mandragora("Mandragora Vermelha");

        Cozinheiro cozinheiro = new Cozinheiro("Senshi", "Ferro");

        cozinheiro.adicionarIngrediente(slime);
        cozinheiro.adicionarIngrediente(mandragora);

        cozinheiro.servirBanquete();
    }
}
