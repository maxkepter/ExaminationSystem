import factory.EntityManagerFactoryProvider;
import factory.LogStatusFactory;
import jakarta.persistence.EntityManagerFactory;
import model.log.LogStatus;
import model.user.User;
import repository.log.LogStatusDao;
import service.authentication.LoginService;


public class TestLogin {
    public static void main(String[] args) {
        testLogin();
    }

    public static void testLogin() {
        LoginService loginService = new LoginService();
        User user = loginService.login("TestUser", "TestPassword");
        if (user != null) {
            System.out.println("Login successful for user: " + user.getFirstName() + " " + user.getLastName());
        } else {
            System.out.println("Login failed.");

        }
    }
}
