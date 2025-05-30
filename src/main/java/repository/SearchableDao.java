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
public interface SearchableDao<E> {
    List<E> findPage(int pageIndex, int pageSize);
    List<E> findByField(String fieldName, Object value);
}
