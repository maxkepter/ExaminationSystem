/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.Map;
import model.exam.Exam;
import repository.FullOptionDAO;

/**
 *
 * @author MasterLong
 */
public class ExamDao extends FullOptionDAO<Exam> {

    public ExamDao(EntityManagerFactory entityManagerFactory, Class<Exam> entityClass) {
        super(entityManagerFactory, entityClass);
    }

    public ExamDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Exam.class);
    }

    public Exam findExamByCode(String examCode) {
        try (EntityManager em = entityManagerFactory.createEntityManager()) {
            String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e WHERE e.examCode" + " = :value";
            return em.createQuery(jpql, entityClass).setParameter("value", examCode).getSingleResult();
        }
    }

}