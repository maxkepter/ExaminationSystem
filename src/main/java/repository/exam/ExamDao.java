/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;
import java.util.List;
import java.util.Map;
import model.exam.Exam;
import repository.FullOptionDAO;

/**
 *
 * @author MasterLong
 */
public class ExamDao extends FullOptionDAO<Exam> {

    private final EntityManagerFactory emf;

    public ExamDao(EntityManagerFactory entityManagerFactory, Class<Exam> entityClass) {
        super(entityManagerFactory, entityClass);
        this.emf = entityManagerFactory;
    }

    public ExamDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Exam.class);
        this.emf = entityManagerFactory;
    }

    public Exam findExamByCode(String examCode) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Exam> query = em.createQuery(
                    "SELECT e FROM Exam e WHERE e.examCode = :code", Exam.class);
            query.setParameter("code", examCode);
            return query.getResultStream().findFirst().orElse(null);
        } finally {
            em.close();
        }
    }

    @Override
    public Exam findById(int id) {
        return findById(new Integer(id));
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }

    @Override
    public void deleteMany(List<Integer> ids) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteMany'");
    }

    @Override
    public void deleteAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteAll'");
    }

}
