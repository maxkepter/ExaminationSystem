package factory;

import model.log.LogStatus;
import repository.log.LogStatusDao;

public class LogStatusFactory {

    private static LogStatus registrationSuccess;
    private static LogStatus loginSuccess;
    private static LogStatus accountActice;
    private static LogStatus bruteForceDetected;
    private static LogStatus accountBanned;
    private static LogStatus wrongPassword;
    private static LogStatus loginFailure;
    private static LogStatus logout;

    private static LogStatusDao logStatusDao = DAOFactory.getLogStatusDao();

    // Private constructor to prevent instantiation
    private LogStatusFactory() {
    }

    private static void checkExist(LogStatus logStatus) {
        if (!logStatusDao.exists(logStatus.getStatusId())) {
            logStatusDao.create(logStatus);
        }
    }

    public static LogStatus getRegistrationSuccess() {
        if (registrationSuccess == null) {
            registrationSuccess = new LogStatus(1, "registration success");
            checkExist(registrationSuccess);
        }
        return registrationSuccess;
    }

    public static LogStatus getLoginSuccess() {
        if (loginSuccess == null) {
            loginSuccess = new LogStatus(2, "login success");
            checkExist(loginSuccess);
        }
        return loginSuccess;
    }

    public static LogStatus getAccountActive() {
        if (accountActice == null) {
            accountActice = new LogStatus(3, "account active");
            checkExist(accountActice);
        }
        return accountActice;
    }

    public static LogStatus getBruteForceDetected() {
        if (bruteForceDetected == null) {
            bruteForceDetected = new LogStatus(4, "brute force detected");
            checkExist(bruteForceDetected);
        }
        return bruteForceDetected;
    }

    public static LogStatus getAccountBanned() {
        if (accountBanned == null) {
            accountBanned = new LogStatus(5, "account banned");
            checkExist(accountBanned);
        }
        return accountBanned;
    }

    public static LogStatus getWrongPassword() {
        if (wrongPassword == null) {
            wrongPassword = new LogStatus(6, "wrong password");
            checkExist(wrongPassword);
        }
        return wrongPassword;
    }

    public static LogStatus getLoginFailure() {
        if (loginFailure == null) {
            loginFailure = new LogStatus(7, "login failure");
            checkExist(loginFailure);
        }
        return loginFailure;
    }

    public static LogStatus getLogout() {
        if (logout == null) {
            logout = new LogStatus(8, "logout");
            checkExist(logout);
        }
        return logout;
    }

}
