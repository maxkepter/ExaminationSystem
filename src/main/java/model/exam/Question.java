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

@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer questionId;

    @Lob
    @Column(name = "QuestionContent", columnDefinition = "VARCHAR(MAX)", nullable = false)
    private String questionContent;

    @Column(nullable = false)
    private Boolean isDisable;

    @ManyToOne
    @JoinColumn(name = "chapterID", nullable = false)
    private Chapter chapter;

    @ManyToOne
    @JoinColumn(name = "difficultyId", nullable = false)
    private Difficulty difficulty;
    
    
}