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
    public ExamDao(EntityManagerFactory entityManagerFactory, Class<Exam> entityClass) {
        super(entityManagerFactory, entityClass);
    }

}
