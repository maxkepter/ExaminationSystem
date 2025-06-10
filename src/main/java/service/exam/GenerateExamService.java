/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.exam;

import java.util.List;
import model.exam.Question;
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

    public List<Question> getQuestionsByChapterAndDifficulty(String chapterNoStr, String difficultyStr) {
        Integer chapterNo = null;
        Integer difficulty = null;

        try {
            if (chapterNoStr != null && !chapterNoStr.isEmpty()) {
                chapterNo = Integer.parseInt(chapterNoStr);
            }
            if (difficultyStr != null && !difficultyStr.isEmpty()) {
                difficulty = Integer.parseInt(difficultyStr);
            }
        } catch (Exception e) {
        }

        return generateExamDao.getQuestions(chapterNoStr, difficultyStr);
    }
}
