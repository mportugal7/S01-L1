public class Main {
    public static void main(String[] args) {

        // CRIANDO OS SERES SOBRENATURAIS
        Alienigena alienigena = new Alienigena("Serpo");
        EspiritoYoukai espirito = new EspiritoYoukai("Turbo Vovo");

        // CRIANDO O MAPA
        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        // REGISTRANDO OS AVISTAMENTOS
        mapa.registrar("Escola", alienigena);
        mapa.registrar("Tunel", espirito);

        // INVESTIGANDO OS LOCAIS
        System.out.println("--- Investigacoes ---");

        mapa.investigar("Escola");
        mapa.investigar("Tunel");
        mapa.investigar("Hospital");
    }
}
