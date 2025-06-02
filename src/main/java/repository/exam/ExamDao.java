/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import model.exam.Exam;
import model.exam.ExamInstance;

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

    public static void main(String[] args) {
        ExamDao dao = new ExamDao();  // tạo instance của ExamDao
        ExamInstance instance = dao.findExamById("EX001");  // gọi qua đối tượng

        if (instance != null) {
            System.out.println("Tìm thấy examCode: " + instance.getExamCode());
            System.out.println("Tên đề thi: " + instance.getExam().getExamName());
        } else {
            System.out.println("Không tìm thấy đề thi với examCode này.");
        }
    }
}
