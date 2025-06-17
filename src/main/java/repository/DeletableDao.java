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
public interface DeletableDao {
    void delete(int id);
    void deleteMany(List<Integer> ids);
    void deleteAll();
}
