/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.exam;

import factory.EntityManagerFactoryProvider;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import model.exam.Exam;
import repository.exam.ExamDao;

/**
 *
 * @author MasterLong
 */
public class ExamCodeGenerator {

    private static String generationExamCode() {
        String examCode = "EXAM_";
        long code = Math.round(Math.random() * 1000000);
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd_MM_yyyy_");
        String text = date.format(formatter);
        return examCode + text + String.valueOf(code);

    }

    public static String getExamCode() {
        ExamDao examDAO = new ExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Exam.class);
        String examCode = generationExamCode();
        while (!examDAO.findByProperty("examCode", examCode).isEmpty()) {
            examCode = generationExamCode();
        }
        return examCode;

    }
}
