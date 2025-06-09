/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Exam;
import repository.DeleteableObjectDao;

/**
 *
 * @author MasterLong
 */
public class ExamDAO extends DeleteableObjectDao<Exam>{
    
    public ExamDAO(EntityManagerFactory entityManagerFactory, Class<Exam> entityClass) {
        super(entityManagerFactory, entityClass);
    }
    
}
