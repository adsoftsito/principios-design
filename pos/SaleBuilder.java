public interface SaleBuilder {
    void buildProduct();

    void buildCustomer();

    void buildTotal();

    Sale getSale();
}
