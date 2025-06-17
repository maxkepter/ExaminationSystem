/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package router;

import factory.EntityManagerFactoryProvider;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import java.util.ArrayList;
import java.util.List;
import model.exam.Chapter;
import model.exam.Subject;
import model.exam.SubjectMajor;
import repository.exam.ChapterDao;
import repository.exam.SubjectDao;
import repository.exam.SubjectMajorDao;

/**
 *
 * @author MasterLong
 */
public class NewClass {
    public static void main(String[] args) {
        SubjectDao subjectDAO = new SubjectDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Subject.class);
        SubjectMajorDao subjectmajorDAO = new SubjectMajorDao(EntityManagerFactoryProvider.getEntityManagerFactory(), SubjectMajor.class);
        ChapterDao chapterDAO = new ChapterDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Chapter.class);
        List<SubjectMajor> allSubjectMajor = subjectmajorDAO.findByProperty("major.id", "8");
        List<Subject> allSubject = new ArrayList();
            for (SubjectMajor c : allSubjectMajor){
                Subject newSubject = subjectDAO.findById(c.getSubject().getSubID());
                allSubject.add(newSubject);
            }
            Jsonb jsonb = JsonbBuilder.create();
            String json = jsonb.toJson(allSubject);
            System.out.println(json);
    }
}
