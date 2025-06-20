/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Subject")
public class Subject {
    @Id
    private int subID;

    @Column(nullable = false, length = 100)
    private String subjectName;

    @Column(nullable = false)
    private boolean isDisable;

    public Subject() {
    }

    public Subject(String subjectName, boolean isDisable) {
        this.subjectName = subjectName;
        this.isDisable = isDisable;
    }

    public int getSubID() {
        return subID;
    }

    public void setSubID(int subID) {
        this.subID = subID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public boolean isDisable() {
        return isDisable;
    }

    public void setDisable(boolean isDisable) {
        this.isDisable = isDisable;
    }

}