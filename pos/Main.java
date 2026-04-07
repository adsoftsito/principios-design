public class Main {
    public static void main(String[] args) {
        // Singleton
        System.out.println("Singleton...");
        POSSystem pos = POSSystem.getInstance();
        pos.start();
        System.out.println("");

        // Factory Method - Login
        System.out.println("Factory Method -...");
        UserFactory userFactory = new AdminFactory();
        User admin = userFactory.createUser();
        admin.login();
        System.out.println("");

        // Abstract Factory - Productos y clientes
        System.out.println("Abstract Factory - Productos y clientes...");
        POSFactory factory = new RetailPOSFactory();
        Product product = factory.createProduct();
        Customer customer = factory.createCustomer();

        System.out.println(product.getName());
        System.out.println(customer.getType());
        System.out.println("");

        // Builder - Venta
        System.out.println("Builder - Venta...");
        SaleDirector director = new SaleDirector();
        Sale sale = director.construct(new SimpleSaleBuilder());
        sale.show();
        System.out.println("");

        // Prototype - Clonar venta
        System.out.println("Prototype - Clonar venta...");
        SalePrototype original = new SalePrototype("VTA-001");
        SalePrototype copy = original.clone();
        copy.show();
    }
}
