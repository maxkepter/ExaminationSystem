
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.swing.text.View;

import factory.DAOFactory;
import model.exam.Exam;
import model.exam.student.StudentExam;
import model.user.User;
import service.admin.ViewUserService;
import service.admin.management.user.DeleteUserService;
import service.exam.GetQuestionInExam;
import service.student.exam.SubmitExamService;

public class TestDao {
    public static void main(String[] args) {
        Exam exam = DAOFactory.getExamDao().findById(6);
        List list = GetQuestionInExam.getQuestionInExam(exam);

        System.out.println(list.size());
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
