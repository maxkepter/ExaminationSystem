/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.exam;

import model.exam.Exam;
import repository.exam.ExamDao;
import utils.Validate;

/**
 *
 * @author FPT SHOP
 */
public class ExamService {
    private ExamDao examDao;

    public ExamService(ExamDao examDao) {
        this.examDao = examDao;
    }

    public Exam searchExamByCode(String examCode) {
        if (!Validate.validateString(examCode)) {
            return null;
        }
        return examDao.findExamByCode(examCode);
    }

    public Exam searchExam(String examCode) throws IllegalArgumentException {
        if (!Validate.validateString(examCode)) {
            throw new IllegalArgumentException("Invalid exam code provided !");
        }

        Exam exam = examDao.findExamByCode(examCode);

        if (exam == null) {
            throw new IllegalArgumentException("Exam not found for exam code " + examCode);
        }

        return exam;
    }
}
