package exception.user.exam;

public class ExamOverException extends RuntimeException {
    public ExamOverException() {
        super("Exam is over !");
    }

    public ExamOverException(String message) {
        super(message);
    }
}
