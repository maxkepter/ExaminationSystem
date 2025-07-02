/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;
import model.exam.Question;
import model.exam.QuestionExam;
import repository.FullOptionDAO;

/**
 *
 * @author MasterLong
 */
public class QuestionExamDao extends FullOptionDAO<QuestionExam>{
    
    public QuestionExamDao(EntityManagerFactory entityManagerFactory, Class<QuestionExam> entityClass) {
        super(entityManagerFactory, entityClass);
    }
    
    public List<Question> findQuestionByProperty(String propertyName, Object value) {
            EntityManager em = entityManagerFactory.createEntityManager();
            String jpql = "SELECT e.question FROM " + entityClass.getSimpleName() + " e WHERE e." + propertyName + " = :value";
            return em.createQuery(jpql, Question.class).setParameter("value", value).getResultList();
        
    }
    
    
}
