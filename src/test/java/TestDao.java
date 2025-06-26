
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import factory.DAOFactory;
import factory.LogStatusFactory;
import model.exam.student.StudentExam;
import model.log.LogStatus;
import model.user.User;
import service.admin.ViewUserService;
import service.student.exam.GenerateStudentExamService;
import service.student.exam.ReloadExamService;
import service.student.exam.SubmitExamService;
import service.student.exam.ViewStudentExamService;

public class TestDao {
    public static void main(String[] args) {
        ViewUserService viewUserService = new ViewUserService();
        int[] maxPage = { 0 };
        List<User> users = viewUserService.getUser(0, maxPage);
        System.out.println(users);
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
