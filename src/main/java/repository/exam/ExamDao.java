/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.exam.Exam;
import model.exam.ExamInstance;
import model.user.User;

/**
 *
 * @author FPT SHOP
 */
public class ExamDao {

    private EntityManagerFactory emf;

    public ExamDao() {
        emf = Persistence.createEntityManagerFactory("ExamManagement");
    }

    public ExamInstance findExamById(String examCode) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<ExamInstance> query = em.createQuery(
                    "SELECT ei FROM ExamInstance ei WHERE ei.examCode = :code", ExamInstance.class);
            query.setParameter("code", examCode);

            return query.getResultStream().findFirst().orElse(null);
        } finally {
            em.close();
        }
    }

    public void createExam(String examName, Integer duration, User user) {
        try (EntityManager em = emf.createEntityManager()) {
            em.getTransaction().begin();
            Exam newExam = new Exam(examName, duration, user);
            em.persist(newExam);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Exam> getAllExams() {
        List<Exam> exams = new ArrayList<>();
        try (EntityManager em = emf.createEntityManager();) {
            exams = em.createQuery("SELECT e FROM Exam e", Exam.class).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exams;
    }

    public void updateExamById(Integer examId, String newName, Integer newDuration, User user) {

        try (EntityManager em = emf.createEntityManager();) {
            em.getTransaction().begin();

            Exam exam = em.find(Exam.class, examId);
            if (exam != null) {
                exam.setExamName(newName);              
                exam.setDuration(newDuration);
                exam.setUser(user);
            }

            em.getTransaction().commit();             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    public static void main(String[] args) {
        ExamDao dao = new ExamDao();
        ExamInstance instance = dao.findExamById("EX001");

        if (instance != null) {
            System.out.println("Tìm thấy examCode: " + instance.getExamCode());
            System.out.println("Tên đề thi: " + instance.getExam().getExamName());
        } else {
            System.out.println("Không tìm thấy đề thi với examCode này.");
        }
    }
}
