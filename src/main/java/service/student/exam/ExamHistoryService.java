package service.student.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import constants.PageSize;
import factory.DAOFactory;
import model.exam.student.StudentExam;
import repository.exam.student.StudentExamDao;

public class ExamHistoryService {
    public List<StudentExam> getHistory(int userId, int pageIndex, int[] maxPage) throws IndexOutOfBoundsException {

        // Set field value
        Map<String, Object> fieldValues = new HashMap<>();
        fieldValues.put(StudentExam.STUDENT, DAOFactory.getStudentDao().findById(userId));
        StudentExamDao studentExamDao = DAOFactory.getStudentExamDao();

        int pageSize = PageSize.STUDENT_EXAM;

        List<StudentExam> studentExams = studentExamDao.findByField(fieldValues);

        // Get max page
        maxPage[0] = (studentExams.size() / pageSize);

        if (maxPage[0] < pageIndex) {
            throw new IndexOutOfBoundsException("Page does not exist !");
        }
        // Paging list
        int start = pageIndex * pageSize;
        int end = (pageIndex + 1) * pageSize < studentExams.size() - 1 ? (pageIndex + 1) * pageSize
                : studentExams.size();

        studentExams = studentExams.subList(start, end);

        return studentExams;
    }
}
