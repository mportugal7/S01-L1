public class Main {
    public static void main(String[] args) {

        Morador mago = new Mago("Howl", "Magia de vento");
        Morador demonio = new DemonioDoFogo("Calcifer");

        mago.apresentar();
        demonio.apresentar();

        // Morador morador = new Morador("Desconhecido");ERRO: nao e possivel instanciar uma classe abstrata
    }
}
