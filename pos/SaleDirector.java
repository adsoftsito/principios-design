public class SaleDirector {
    public Sale construct(SaleBuilder builder) {
        builder.buildProduct();
        builder.buildCustomer();
        builder.buildTotal();
        return builder.getSale();
    }
}
