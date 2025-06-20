package service.authentication;

import factory.LogStatusFactory;
import model.user.User;
import service.log.LogService;
import service.log.LoginLogService;

public class LogoutService {
    public void logout(User user) {
        if (user == null || user.getUserID() == null) {
            throw new IllegalArgumentException("User cannot be null or have an empty userID!");
        }

        // Log the logout event
        LogService logService = new LoginLogService();
        logService.createUserLog(user, LogStatusFactory.LOGOUT);
    }

}
