package service.admin.management.user;

import java.util.List;
import java.util.Map;

import factory.DAOFactory;
import model.exam.student.StudentExam;
import model.log.ExamLog;
import model.user.Student;
import utils.FieldValueBuilder;

public class ViewStudentExamLogService {

    private FieldValueBuilder fieldValueBuilder = new FieldValueBuilder();

    public List<ExamLog> getLog(Integer userId, Integer studentExamId) {

        Student student = DAOFactory.getStudentDao().findById(userId);

        Map<String, Object> fieldValue = fieldValueBuilder
                .buildFieldValue(StudentExam.STUDENT, student)
                .buildFieldValue(StudentExam.STUDENT_EXAM_ID, studentExamId)
                .build();

        List<ExamLog> examLogs = DAOFactory.getExamLogDao().findByField(fieldValue);

        return examLogs;

    }
}
