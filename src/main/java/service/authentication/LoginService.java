package service.authentication;

import java.time.LocalDateTime;

import exception.login.AccountBannedException;
import exception.login.AuthenticationException;
import factory.EntityManagerFactoryProvider;
import factory.LogStatusFactory;
import model.log.BanLog;
import model.log.LogStatus;
import model.log.LoginLog;
import model.user.LoginInfo;
import model.user.User;
import repository.log.BanLogDao;
import repository.log.LoginLogDao;
import repository.user.LoginInfoDao;
import utils.Validate;

public class LoginService {
    public User login(String userName, String password) throws AuthenticationException,AccountBannedException,IllegalArgumentException {
       // Validate the input parameters
        if (!Validate.validateString(userName) || !Validate.validateString(password)) {
            throw new IllegalArgumentException("Username or password cannot be blank !");
        }

        LoginInfoDao loginInfoDao = new LoginInfoDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginInfo.class);

        LoginInfo loginInfo = loginInfoDao.findByUserName(userName);
        User user = loginInfo.getUser();
        // If loginInfo is null, it means the user does not exist or the username is incorrect
        if (loginInfo == null) {
            throw new AuthenticationException();
        }
        // If the password does not match, throw an AuthenticationException
        if (!LoginInfo.checkPassword(loginInfo, password)) {
            loginLog(user, LogStatusFactory.getLogStatus("wrong password"));
            throw new AuthenticationException();
        }
        // If the user is banned, log the event and throw an AccountBannedException
        if (isBanned(user)) {
            loginLog(user, LogStatusFactory.getLogStatus("banned user"));
            throw new AccountBannedException();
        }

        // If the user is not banned and the login is successful, log the event
        loginLog(user, LogStatusFactory.getLogStatus("login success"));
        return loginInfo.getUser();
    }

    public void loginLog(User user, LogStatus logStatus) {
        LoginLog loginLog = new LoginLog(LocalDateTime.now(), user, logStatus);
        LoginLogDao loginLogDao = new LoginLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginLog.class);
        loginLogDao.create(loginLog);
    }

    public boolean isBanned(User user) {
        if (user == null || user.getUserID() == null) {
            return false; // If user is null or userID is not set, consider not banned
        }
        BanLogDao banLogDao = new BanLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(), BanLog.class);
        return banLogDao.isBanned(user);
    }
}
