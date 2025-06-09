package service.log;

import java.time.LocalDateTime;

import factory.EntityManagerFactoryProvider;
import model.log.LogStatus;
import model.log.LoginLog;
import model.user.User;
import repository.log.LoginLogDao;

public class LoginLogService implements LogService {

    @Override
    public void createUserLog(User user, LogStatus logStatus) {
        LoginLog loginLog = new LoginLog(LocalDateTime.now(), user, logStatus);
        LoginLogDao loginLogDao = new LoginLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginLog.class);
        loginLogDao.create(loginLog);
    }

}
