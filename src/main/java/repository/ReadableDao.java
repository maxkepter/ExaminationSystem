/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface ReadableDao<E> {
    E findById(int id);
    List<E> findAll();
    long count();
    boolean exists(int id);
}
