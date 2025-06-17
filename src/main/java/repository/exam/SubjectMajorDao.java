/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.exam.SubjectMajor;
import repository.FullOptionDAO;

/**
 *
 * @author MasterLong
 */
public class SubjectMajorDao extends FullOptionDAO<SubjectMajor>{
    
    public SubjectMajorDao(EntityManagerFactory entityManagerFactory, Class<SubjectMajor> entityClass) {
        super(entityManagerFactory, entityClass);
    }
    @Override
    public void create(SubjectMajor object) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.merge(object);
            entityManager.getTransaction().commit();
        }

    }
    
}
