package factory;

import model.log.LogStatus;

public class LogStatusFactory {
    public static final LogStatus REGISTRATION_SUCCESS = new LogStatus(4, "registration success");
    public static final LogStatus LOGIN_SUCCESS = new LogStatus(5, "login success");
    public static final LogStatus ACCOUNT_ACTIVE = new LogStatus(6, "account active");
    public static final LogStatus BRUTE_FORCE_DETECTED = new LogStatus(7, "brute force detected");
    public static final LogStatus ACCOUNT_BANNED = new LogStatus(8, "account banned");
    public static final LogStatus WRONG_PASSWORD = new LogStatus(9, "wrong password");
    public static final LogStatus LOGIN_FAILURE = new LogStatus(10, "login failure");
    public static final LogStatus LOGOUT = new LogStatus(11, "logout");
    public static final LogStatus EXAM_SUSPENDED = new LogStatus(12, "exam suspended");

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
