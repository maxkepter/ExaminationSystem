package service.student.exam;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import constants.PageSize;
import factory.DAOFactory;
import model.exam.student.StudentExam;
import repository.exam.student.StudentExamDao;
import utils.PagingList;

public class ExamHistoryService {
        public List<StudentExam> getHistory(int userId, int pageIndex, int[] maxPage) throws IndexOutOfBoundsException {

                // Set field value
                Map<String, Object> fieldValues = new HashMap<>();
                fieldValues.put(StudentExam.STUDENT, DAOFactory.getStudentDao().findById(userId));
                StudentExamDao studentExamDao = DAOFactory.getStudentExamDao();

                int pageSize = PageSize.STUDENT_EXAM;

                List<StudentExam> studentExams = studentExamDao.findByField(fieldValues);
                Collections.reverse(studentExams);
                // Get max page
                maxPage[0] = (studentExams.size() / pageSize);

                return PagingList.paging(studentExams, pageIndex, maxPage[0], pageSize);
        }
}
