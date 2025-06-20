package exception.login;

public class AccountBannedException extends RuntimeException {
    public AccountBannedException() {
        super("This account is banned !");
    }

    public AccountBannedException(String message) {
        super(message);
    }
}
