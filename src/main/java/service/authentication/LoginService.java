package service.authentication;

import java.time.LocalDateTime;
import java.util.List;

import constants.LogConstants;
import exception.login.AccountBannedException;
import exception.login.AuthenticationException;
import factory.EntityManagerFactoryProvider;
import factory.LogStatusFactory;
import jakarta.ejb.Local;
import jakarta.persistence.EntityManagerFactory;
import model.log.BanLog;
import model.log.LoginLog;
import model.user.LoginInfo;
import model.user.User;
import repository.log.BanLogDao;
import repository.log.LoginLogDao;
import repository.user.LoginInfoDao;
import service.log.LogService;
import service.log.LoginLogService;
import utils.Validate;

public class LoginService {
    public User login(String userName, String password)
            throws AuthenticationException, AccountBannedException, IllegalArgumentException {
        LogService logService = new LoginLogService();
        // Validate the input parameters
        if (!Validate.validateString(userName) || !Validate.validateString(password)) {
            throw new IllegalArgumentException("Username or password cannot be blank !");
        }

        LoginInfoDao loginInfoDao = new LoginInfoDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginInfo.class);

        LoginInfo loginInfo = loginInfoDao.findByUserName(userName);
        // If loginInfo is null, it means the user does not exist or the username is
        // incorrect
        if (loginInfo == null) {
            throw new AuthenticationException();
        }

        User user = loginInfo.getUser();

        if (bruteForceDetect(user)) {
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime endTime = now.minusMinutes(LogConstants.LOGIN_BAN_DURATION_MINUTES);

            // Create a BanLog entry for the user
            BanLogDao banLogDao = new BanLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(), BanLog.class);
            BanLog banLog = new BanLog(now, endTime, user, LogStatusFactory.ACCOUNT_BANNED);
            banLogDao.create(banLog);
            // Log the brute force detection event
            logService.createUserLog(user, LogStatusFactory.BRUTE_FORCE_DETECTED);
            throw new AccountBannedException("User is banned due to attemp too much.");
        }

        // If the password does not match, throw an AuthenticationException
        if (!LoginInfo.checkPassword(loginInfo, password)) {
            logService.createUserLog(user, LogStatusFactory.WRONG_PASSWORD);
            throw new AuthenticationException();
        }
        // If the user is banned, log the event and throw an AccountBannedException
        if (isBanned(user)) {
            logService.createUserLog(user, LogStatusFactory.ACCOUNT_BANNED);
            throw new AccountBannedException();
        }

        // If the user is not banned and the login is successful, log the event

        logService.createUserLog(user, LogStatusFactory.LOGIN_SUCCESS);

        return loginInfo.getUser();
    }

    public User adminLogin(String userName, String password) {
        User user = login(userName, password);
        return user;
    }

    public boolean isBanned(User user) {
        if (user == null || user.getUserID() == null) {
            return false; // If user is null or userID is not set, consider not banned
        }
        BanLogDao banLogDao = new BanLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(), BanLog.class);
        return banLogDao.isBanned(user);
    }

    public boolean bruteForceDetect(User user) {
        if (user == null || user.getUserID() == null) {
            throw new IllegalArgumentException("User cannot be null or have an unset userID");
        }
        LoginLogDao loginLogDao = new LoginLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginLog.class);
        // Check the number of login attempts in the last 5 minutes
        // If the number of attempts exceeds the limit, ban the user and log the event
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime startTime = now.minusMinutes(LogConstants.LOGIN_ATTEMPT_EXPIRATION_MINUTES);
        List<LoginLog> list = loginLogDao.findByTimeRange(user, startTime, now);
        return list.size() > LogConstants.LIMIT_LOGIN_ATTEMPTS;

    }
}
