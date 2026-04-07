public class RetailPOSFactory implements POSFactory {

    public Product createProduct() {
        return () -> "Producto de tienda";
    }

    public Customer createCustomer() {
        return () -> "Cliente minorista";
    }
}
