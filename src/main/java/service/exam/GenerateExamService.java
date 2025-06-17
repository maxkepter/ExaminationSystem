/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.exam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.exam.Question;
import model.exam.QuestionTemplate;
import repository.exam.student.GenerateExamDao;

/**
 *
 * @author FPT SHOP
 */
public class GenerateExamService {

    private GenerateExamDao generateExamDao;

    public GenerateExamService(GenerateExamDao generateExamDao) {
        this.generateExamDao = generateExamDao;
    }

    public List<Question> generateExam(List<QuestionTemplate> templates) {
        List<Question> result = new ArrayList<>();
        for (QuestionTemplate template : templates) {
            String chapterNo = template.getChapterNo();
            String difficulty = template.getDifficulty();
            int amount = template.getAmount();

            List<Question> questions = generateExamDao.getQuestions(chapterNo, difficulty);
            if (questions.size() >= amount) {
                Collections.shuffle(questions);
                result.addAll(questions.subList(0, amount));
            } else {
                result.addAll(questions);
            }
        }
        return result;
    }
}
