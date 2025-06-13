import java.time.LocalDateTime;

import model.user.User;
import service.authentication.LoginService;
import service.authentication.RegisterService;

public class TestLogin {
    public static void main(String[] args) {
        // testLogin("Test", "TestPassword");
        // System.out.println("Login test completed successfully.");

        System.out.println(LocalDateTime.now().minusMinutes(20).isBefore(LocalDateTime.now()));
    }

    public static void testLogin(String userName, String password) {
        LoginService loginService = new LoginService();
        loginService.login(userName, password);
    }

    public static void testRegister() {
        RegisterService registerService = new RegisterService();
        User user = new User("TestUser", "TestUser", 1, "Test");
        registerService.register("Test", "TestPassword", user);
    }

}
