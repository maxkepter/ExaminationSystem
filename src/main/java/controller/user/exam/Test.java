/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.user.exam;

import factory.EntityManagerFactoryProvider;
import java.util.ArrayList;
import java.util.List;
import model.exam.Exam;
import model.exam.Question;
import repository.exam.ExamDao;
import repository.exam.QuestionDao;

/**
 *
 * @author MasterLong
 */
public class Test {
    public static void main(String[] args) {
        List<Question> allEasyQuest = new ArrayList();
            List<Question> allNormalQuest = new ArrayList();
            List<Question> allHardQuest = new ArrayList();
            String[] chapterId = {"2"};
            QuestionDao questionDAO = new QuestionDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Question.class);
        for (String chapter : chapterId) {
                allEasyQuest.addAll(questionDAO.findByProperties("difficulty", "1", "chapter.chapterID", chapter));
                allNormalQuest.addAll(questionDAO.findByProperties("difficulty", "2", "chapter.chapterID", chapter));
                allHardQuest.addAll(questionDAO.findByProperties("difficulty", "3", "chapter.chapterID", chapter));
            }
        
        System.out.println(allEasyQuest.get(0).getQuestionContent());
        System.out.println(allNormalQuest);
        System.out.println(allHardQuest);
    }
}
