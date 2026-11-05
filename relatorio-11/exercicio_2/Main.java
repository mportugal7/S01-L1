public class Main {
    public static void main(String[] args) {

        ItemDoCardapio cafe = new ItemDoCardapio("Cafe coado", 8.0);
        ItemDoCardapio curry = new ItemDoCardapio("Curry da casa", 25.0);

        ComboLeblanc combo = new ComboLeblanc("Combo Cafe + Curry", 30.0);

        CafeLeblanc leblanc = new CafeLeblanc();

        leblanc.adicionar(cafe);
        leblanc.adicionar(curry);
        leblanc.adicionar(combo);

        leblanc.mostrarCardapio();
    }
}
