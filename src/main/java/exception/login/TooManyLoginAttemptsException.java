package exception.login;

public class TooManyLoginAttemptsException extends RuntimeException {
    public TooManyLoginAttemptsException() {
        super("You have entered too many incorrect login attempts. Please wait a few minutes.");
    }

    public TooManyLoginAttemptsException(String message) {
        super(message);
    }
}
