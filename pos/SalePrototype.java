public class SalePrototype implements Cloneable {

    private String folio;

    public SalePrototype(String folio) {
        this.folio = folio;
    }

    public SalePrototype clone() {
        return new SalePrototype(this.folio);
    }

    public void show() {
        System.out.println("Venta clonada, folio: " + folio);
    }
}
