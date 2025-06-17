/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;
import java.util.Map;

/**
 *
 * @author MasterLong
 * @param <E>
 */
public abstract class FullOptionDAO<E>{

    protected EntityManagerFactory entityManagerFactory;
    protected final Class<E> entityClass;

    public FullOptionDAO(EntityManagerFactory entityManagerFactory, Class<E> entityClass) {
        this.entityClass = entityClass;
        this.entityManagerFactory = entityManagerFactory;
    }

    
    public void create(E object) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.persist(object);
            entityManager.getTransaction().commit();
        }

    }


    public void createMany(List<E> objects) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            entityManager.getTransaction().begin();
            for (E entity: objects){
                entityManager.persist(entity);
            }
            entityManager.getTransaction().commit();
        }
    }


    public E findById(Object id) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            return entityManager.find(entityClass, id);
        }
    }
    public List<E> findByProperty(String propertyName, Object value) {
        try (EntityManager em = entityManagerFactory.createEntityManager()) {
            String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e WHERE e." + propertyName + " = :value";
            return em.createQuery(jpql, entityClass).setParameter("value", value).getResultList();
        }
    }


    public List<E> findAll() {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            String jpql = "Select u FROM " + entityClass.getSimpleName() + " u ";
            return entityManager.createQuery(jpql,entityClass).getResultList();
        }
    }


    public long count() {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            String jpql = "Select COUNT(u) FROM " + entityClass.getSimpleName() + " u ";
            return (Long)(entityManager.createQuery(jpql,entityClass).getSingleResult());
        }
    }


    public boolean exists(Object id) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            String jpql = "Select COUNT(u) FROM " + entityClass.getSimpleName() + " u ";
            return (Long)entityManager.createQuery(jpql).getSingleResult() > 0;
        }
    }


    public void update(E object, Object id) {
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            entityManager.getTransaction().begin();
            E toUpdate = entityManager.find(entityClass, id);
            if (toUpdate!= null ){
                entityManager.merge(object);
            }
           entityManager.getTransaction().commit();
        }
    }


    public void updatePartial(int id, Map<String, Object> fields) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    

    public void deleteById(Object id){
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            entityManager.getTransaction().begin();
            E toDelete = entityManager.find(entityClass, id);
            if (toDelete!= null ){
                entityManager.remove(toDelete);
            }
           entityManager.getTransaction().commit();
        }
    }

    
}
