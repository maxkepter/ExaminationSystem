/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;
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
            TypedQuery<Exam> query = em.createQuery(
                    "SELECT e FROM Exam e WHERE e.examCode = :code", Exam.class);
            query.setParameter("code", examCode);
            return query.getResultStream().findFirst().orElse(null);
        }
    }
}
