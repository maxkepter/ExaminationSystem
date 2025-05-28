package service.authentication;

import exception.login.UserNameDuplicatedException;
import factory.EntityManagerFactoryProvider;
import factory.LogStatusFactory;
import model.user.LoginInfo;
import model.user.User;
import repository.user.LoginInfoDao;
import utils.HashInfo;
import utils.Validate;

public class RegisterService {
    public void register(String userName, String password, User user)
            throws IllegalArgumentException, UserNameDuplicatedException {
        // Validate the input parameters
        if (!Validate.validateString(userName) || !Validate.validateString(password)) {
            throw new IllegalArgumentException("Username or password cannot be blank !");
        }

        // Validate the user object
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null !");
        }

        LoginInfoDao loginInfoDao = new LoginInfoDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginInfo.class);

        // Check if the username already exists
        if (loginInfoDao.findByUserName(userName) != null) {
            throw new UserNameDuplicatedException();
        }

        // Create and save a new LoginInfo object
        // Password should be hashed before saving
        LoginInfo loginInfo = new LoginInfo(
                user.getUserID(),
                user,
                userName,
                HashInfo.hash(password),
                LogStatusFactory.ACCOUNT_ACTIVE);
        loginInfoDao.create(loginInfo);

        // Log the registration success
        LoginService loginService = new LoginService();
        loginService.loginLog(user, LogStatusFactory.REGISTRATION_SUCCESS);

    }
}
