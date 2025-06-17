/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

/**
 *
 * @author FPT SHOP
 */
public class QuestionTemplate {

    private String chapterNo;
    private String difficulty;
    private int amount;

    public QuestionTemplate() {
    }

    public QuestionTemplate(String chapterNo, String difficulty, int amount) {
        this.chapterNo = chapterNo;
        this.difficulty = difficulty;
        this.amount = amount;
    }

    public String getChapterNo() {
        return chapterNo;
    }

    public void setChapterNo(String chapterNo) {
        this.chapterNo = chapterNo;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
