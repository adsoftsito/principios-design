public class AdminFactory extends UserFactory {
    public User createUser() {
        return new AdminUser();
    }
}
