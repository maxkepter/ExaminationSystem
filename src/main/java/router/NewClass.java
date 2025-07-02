/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package router;

import factory.EntityManagerFactoryProvider;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import java.util.List;
import model.exam.Chapter;
import repository.exam.ChapterDao;

/**
 *
 * @author MasterLong
 */
public class NewClass {
    public static void main(String[] args) {
         ChapterDao chapterDAO = new ChapterDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Chapter.class);
        List<Chapter> allChapter = chapterDAO.findByProperty("subject.id","1");
        Jsonb jsonb = JsonbBuilder.create();
        String json = jsonb.toJson(allChapter);
        System.out.println(json);
        
        System.out.println("");
    }
}
