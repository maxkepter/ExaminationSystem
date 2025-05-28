package service.authentication;

import factory.LogStatusFactory;
import model.user.User;

public class LogoutService {
public void logout(User user) {
        if (user == null || user.getUserID() == null) {
            throw new IllegalArgumentException("User cannot be null or have an empty userID!");
        }

        // Log the logout event
        LoginService loginService = new LoginService();
        loginService.loginLog(user, LogStatusFactory.LOGOUT);
    }
}
