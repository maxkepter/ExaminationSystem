import factory.DAOFactory;
import model.user.User;
import service.authentication.LoginService;
import service.authentication.RegisterService;
import service.user.UpdateUserInfoService;

public class TestLogin {
    public static void main(String[] args) {
        User user = DAOFactory.getUserDao().findById(5);
        UpdateUserInfoService updateUserInfoService = new UpdateUserInfoService();
        System.out.println(user);
        updateUserInfoService.update(user.getUserID(), user.getFirstName(),
                user.getLastName(), "Lmao");
        System.out.println(user);
    }

    public static User testLogin(String userName, String password) {
        LoginService loginService = new LoginService();
        User user = loginService.login(userName, password);
        return user;
    }

    public static void testRegister() {
        RegisterService registerService = new RegisterService();
        User user = new User("TestUser", "TestUser", 1, "Test");
        registerService.register("Test", "TestPassword", user);
    }

}
