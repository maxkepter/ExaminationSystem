package exception.login;

public class UserNameDuplicatedException extends RuntimeException {

    public UserNameDuplicatedException() {
        super("Username is already taken. Please choose a different username.");
    }

    public UserNameDuplicatedException(String message) {
        super(message);
    }
}
