import java.util.HashMap;

public class MapaDeAvistamentos {

    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);

        if (ser == null) {
            System.out.println("O local " + local + " esta tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}
