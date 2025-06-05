/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Question")
public class Question {
    @Id
    private int questionId;

    @Lob
    @Column(nullable = false, columnDefinition = "VARCHAR(MAX)")
    private String questionContent;

    @Column(nullable = false)
    private boolean isDisable;

    @Column(nullable = false)
    private int difficulty;

    @ManyToOne
    @JoinColumn(name = "chapterID", nullable = false)
    private Chapter chapter;

    // Getters and Setters
}