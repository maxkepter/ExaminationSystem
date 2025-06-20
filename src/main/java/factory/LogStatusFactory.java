package factory;

import model.log.LogStatus;

public class LogStatusFactory {
    public static final LogStatus REGISTRATION_SUCCESS = new LogStatus(1, "registration success");
    public static final LogStatus LOGIN_SUCCESS = new LogStatus(2, "login success");
    public static final LogStatus ACCOUNT_ACTIVE = new LogStatus(3, "account active");
    public static final LogStatus BRUTE_FORCE_DETECTED = new LogStatus(4, "brute force detected");
    public static final LogStatus ACCOUNT_BANNED = new LogStatus(5, "account banned");
    public static final LogStatus WRONG_PASSWORD = new LogStatus(6, "wrong password");
    public static final LogStatus LOGIN_FAILURE = new LogStatus(7, "login failure");
    public static final LogStatus LOGOUT = new LogStatus(8, "logout");

    public static LogStatus getLogStatus(String status) {
        switch (status) {
            case "registration success":
                return REGISTRATION_SUCCESS;
            case "login success":
                return LOGIN_SUCCESS;
            case "account banned":
                return ACCOUNT_BANNED;
            case "wrong password":
                return WRONG_PASSWORD;
            case "login failure":
                return LOGIN_FAILURE;
            case "logout":
                return LOGOUT;
            default:
                throw new IllegalArgumentException("Unknown log status: " + status);
        }
    }
}
