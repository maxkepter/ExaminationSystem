/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.exam.Exam;

/**
 *
 * @author FPT SHOP
 */
public class ExamDao {
    private EntityManagerFactory emf;

    public ExamDao() {
        emf = Persistence.createEntityManagerFactory("ExamManagement");
    }

    public Exam findExamById(String id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Exam.class, id);
        } finally {
            em.close();
        }
    }
    public static void main(String[] args) {
        ExamDao examDAO = new ExamDao();
        System.out.println(examDAO.findExamById("1").toString());
    }
}
