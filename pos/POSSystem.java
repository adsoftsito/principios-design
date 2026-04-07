public class POSSystem {

    private static POSSystem instance;

    private POSSystem() {
    }

    public static POSSystem getInstance() {
        if (instance == null) {
            instance = new POSSystem();
        }
        return instance;
    }

    public void start() {
        System.out.println("Sistema Punto de Venta iniciado");
    }
}
