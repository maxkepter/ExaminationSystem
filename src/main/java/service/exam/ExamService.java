/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.exam;

import model.exam.Exam;
import repository.exam.ExamDao;

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
        if (examCode == null || examCode.isEmpty()) {
            return null;
        }
        return examDao.findExamByCode(examCode);
    }
}
