package exception.user.exam;

public class ExamSuspendedException extends RuntimeException {
    public ExamSuspendedException() {
        super("This exam is suspended !");
    }

    public ExamSuspendedException(String message) {
        super(message);
    }
}
