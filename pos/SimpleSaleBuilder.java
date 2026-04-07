public class SimpleSaleBuilder implements SaleBuilder {

    private Sale sale = new Sale();

    public void buildProduct() {
        sale.product = "Producto POS";
    }

    public void buildCustomer() {
        sale.customer = "Cliente POS";
    }

    public void buildTotal() {
        sale.total = 100.0;
    }

    public Sale getSale() {
        return sale;
    }
}
