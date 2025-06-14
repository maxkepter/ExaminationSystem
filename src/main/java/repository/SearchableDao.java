/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface SearchableDao<E> {
    List<E> findPage(Map<String, Object> fieldValues, int pageIndex, int pageSize);

    List<E> findByField(Map<String, Object> fieldValues);
}
