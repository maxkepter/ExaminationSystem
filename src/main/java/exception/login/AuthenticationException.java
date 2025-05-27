package exception.login;

public class AuthenticationException extends RuntimeException {
    public AuthenticationException() {
        super("User name or password are incorrect !");
    }

    public AuthenticationException(String message) {
        super(message);
    }
}
