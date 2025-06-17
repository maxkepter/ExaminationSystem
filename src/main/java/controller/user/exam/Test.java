/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.user.exam;

import factory.EntityManagerFactoryProvider;
import java.util.List;
import model.exam.Exam;
import repository.exam.ExamDao;

/**
 *
 * @author MasterLong
 */
public class Test {
    public static void main(String[] args) {
        ExamDao examDAO = new ExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Exam.class);
        List<Exam> exams = examDAO.findByProperty("examCode", "EXAM-002");
        System.out.println(exams.get(0).getExamName());
    }
}
