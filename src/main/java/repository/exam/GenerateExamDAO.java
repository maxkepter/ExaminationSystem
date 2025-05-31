/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import java.util.Collections;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.exam.*;

/**
 *
 * @author FPT SHOP
 */
public class GenerateExamDAO {

    private EntityManagerFactory entityManagerFactory;

    public GenerateExamDAO(EntityManagerFactory emf) {
        this.entityManagerFactory = emf;
    }

    protected EntityManager getEntityManager() {
        return entityManagerFactory.createEntityManager();
    }

    public List<Question> generateQuestion(Template template) {
        EntityManager em = getEntityManager();
        try {
            Exam exam = template.getExam();
            Difficulty difficulty = template.getDifficulty();
            Chapter chapter = template.getChapter();
            int totalQuest = template.getTotalQuest();
            List<Question> questions = em.createQuery(
                    "SELECT q FROM Question q WHERE q.exam = :exam AND q.difficulty = :difficulty AND q.chapter = :chapter",
                    Question.class)
                    .setParameter("exam", exam)
                    .setParameter("difficulty", difficulty)
                    .setParameter("chapter", chapter)
                    .getResultList();
            Collections.shuffle(questions);
            int total = Math.min(totalQuest, questions.size());

            return questions.subList(0, total);
        } finally {
            em.close();
        }
    }
}
