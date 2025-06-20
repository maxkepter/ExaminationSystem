/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import java.util.Map;

/**
 *
 * @author Admin
 */
public interface UpdatableDao<E> {
    void update(E object);

    void updatePartial(int id, Map<String, Object> fields);
}
