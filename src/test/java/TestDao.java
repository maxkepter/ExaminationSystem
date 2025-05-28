
import service.login.LoginService;
import utils.HashInfo;

public class TestDao {
    public static void main(String[] args) {
        String str = "TestString";
        System.out.println(str);
        str = HashInfo.hash(str);
        System.out.println(str);

        LoginService loginService = new LoginService();
        loginService.login(str, str);

    }
}
