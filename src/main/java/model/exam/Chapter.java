/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Chapter")
public class Chapter {
    @Id
    private int chapterID;

    @Column(nullable = false)
    private int chapterNo;

    @Column(nullable = false)
    private boolean isDisable;

    @ManyToOne
    @JoinColumn(name = "subID", nullable = false)
    private Subject subject;

    public Chapter() {
    }

    public Chapter(int chapterNo, boolean isDisable, Subject subject) {
        this.chapterNo = chapterNo;
        this.isDisable = isDisable;
        this.subject = subject;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public int getChapterNo() {
        return chapterNo;
    }

    public void setChapterNo(int chapterNo) {
        this.chapterNo = chapterNo;
    }

    public boolean isDisable() {
        return isDisable;
    }

    public void setDisable(boolean isDisable) {
        this.isDisable = isDisable;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

}