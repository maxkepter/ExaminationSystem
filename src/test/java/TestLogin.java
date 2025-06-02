import service.authentication.LoginService;

public class TestLogin {
    public static void main(String[] args) {
        testLogin();
    }

    public static void testLogin() {

        LoginService loginService = new LoginService();
        try {
            loginService.login("hunter", "123456");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("Login failed!");
            return;
        }
        System.out.println("Login successful!");

    }
}
