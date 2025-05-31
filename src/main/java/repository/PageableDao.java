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
public interface PageableDao<E> {
    List<E> findPage(int pageIndex, int pageSize);
    List<E> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc);    
}
