package service.login;

import exception.login.AuthenticationException;
import factory.EntityManagerFactoryProvider;
import model.user.LoginInfo;
import model.user.User;
import repository.log.LoginLogDao;
import repository.user.LoginInfoDao;
import utils.Validate;

public class LoginService {
    public User login(String userName, String password) throws AuthenticationException {
        if (!Validate.validateString(userName) || !Validate.validateString(password)) {
            throw new AuthenticationException("Username or password cannot be blank !");
        }

        LoginInfoDao loginInfoDao = new LoginInfoDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginInfo.class);

        LoginInfo loginInfo = loginInfoDao.findByUserName(userName);
        if (loginInfo == null || !LoginInfo.checkPassword(loginInfo, password)) {
            throw new AuthenticationException();
        }

        // Log the login attempt
        // LoginLogDao loginLogDao = new
        // LoginLogDao(EntityManagerFactoryProvider.getEntityManagerFactory());

        return loginInfo.getUser();

    }
}
