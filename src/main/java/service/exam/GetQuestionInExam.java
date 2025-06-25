/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.exam;

import factory.EntityManagerFactoryProvider;
import java.util.List;
import model.exam.Exam;
import model.exam.Question;
import model.exam.QuestionExam;
import repository.exam.QuestionExamDao;

/**
 *
 * @author MasterLong
 */
public class GetQuestionInExam {
    public static List<Question> getQuestionInExam(String examCode){
        QuestionExamDao questionExamDAO = new QuestionExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), QuestionExam.class);
        List<Question> questionList = questionExamDAO.findQuestionByProperty("examCode", examCode);
        return questionList;
    }
}
