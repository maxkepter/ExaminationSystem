//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Map;
//import java.util.Scanner;
//import java.util.Set;
//
//import model.exam.student.Option;
//import model.exam.student.QuestionWithOptions;
//import model.exam.student.StudentExam;
//
//public class TestDataGenerator {
//    public static void main(String[] args) {
//        // Tạo danh sách câu hỏi mẫu
//        List<QuestionWithOptions> questions = new ArrayList<>();
//
//        for (int i = 0; i < 6; i++) {
//            List<Option> options = new ArrayList<>();
//            for (int j = 0; j < 4; j++) {
//                boolean isCorrect = (j % 2 == 0); // hai đáp án đúng
//                options.add(new Option(j, "Option " + (char) ('A' + j), isCorrect));
//            }
//
//            QuestionWithOptions q = new QuestionWithOptions("Câu hỏi số " + (i + 1), options);
//            questions.add(q);
//        }
//        QuestionWithOptions.randomQuestion(questions);
//
//        printQuestions(questions);
//
//    }
//
//    // In ra danh sách câu hỏi và đáp án
//    public static void printQuestions(List<QuestionWithOptions> questions) {
//        Map<Integer, Set<Integer>> studentChoice = new HashMap<>();
//        Scanner scanner = new Scanner(System.in);
//        for (QuestionWithOptions q : questions) {
//            Set<Integer> choices = new HashSet<>();
//            System.out.println("Câu hỏi: " + q.getContent());
//            for (Option option : q.getOptions()) {
//                System.out.println(" - " + option.getContent() + (option.isCorrect() ? "Correct" : ""));
//            }
//            System.out.println(q.getCorrectId());
//
//            while (true) {
//                System.out.println("Enter your answer: ");
//                int answer = scanner.nextInt();
//                if (answer == 4) {
//                    break;
//                }
//                choices.add(answer);
//            }
//
//            System.out.println(choices);
//            studentChoice.put(q.getQuestionId(), choices);
//        }
//
//    }
//
//}
