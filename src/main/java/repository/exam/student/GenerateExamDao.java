/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam.student;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;
import model.exam.Question;

/**
 *
 * @author FPT SHOP
 */
public class GenerateExamDao {
    private EntityManagerFactory emf;

    public GenerateExamDao(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public List<Question> getQuestions(String chapterNo, String difficulty) {
        EntityManager em = emf.createEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT q FROM Question q WHERE q.isDisable = false");
            if (chapterNo != null) {
                jpql.append(" AND q.chapter.chapterNo = :chapterNo");
            }
            if (difficulty != null) {
                jpql.append(" AND q.difficulty = :difficulty");
            }

            var query = em.createQuery(jpql.toString(), Question.class);

            if (chapterNo != null) {
                query.setParameter("chapterNo", chapterNo);
            }
            if (difficulty != null) {
                query.setParameter("difficulty", difficulty);
            }

            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
