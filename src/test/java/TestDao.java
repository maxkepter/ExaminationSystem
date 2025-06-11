
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import controller.admin.exam.GenerateExam;
import model.exam.student.StudentExam;
import service.exam.GenerateExamService;
import service.student.exam.GenerateStudentExamService;
import service.student.exam.SubmitExamService;

public class TestDao {
    public static void main(String[] args) {
        Map<Integer, Set<Integer>> studentChoice = genChoice(100);
        testExam(studentChoice, "3");
    }

    public static void testExam(Map<Integer, Set<Integer>> studentChoice, String studentExamIdstr) {
        SubmitExamService submitExamService = new SubmitExamService();
        // GenerateStudentExamService examService = new GenerateStudentExamService();
        StudentExam studentExam = submitExamService.submitExam(studentChoice, studentExamIdstr);

        System.out.println(studentExam.getScore());
    }

    private static Map<Integer, Set<Integer>> genChoice(int size) {
        Map<Integer, Set<Integer>> choice = new HashMap<>();
        for (int i = 0; i < size; i++) {
            Set<Integer> set = new HashSet<>();
            set.add(0);
            choice.put(i, set);
        }
        return choice;
    }
}
