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
@Table(name = "QuestionOption")
public class QuestionOption {
    @Id
    private int optionId;

    @Column(nullable = false)
    private boolean isCorrect;

    @Lob
    @Column(nullable = false, columnDefinition = "VARCHAR(MAX)")
    private String optionContent;

    @ManyToOne
    @JoinColumn(name = "questionId", nullable = false)
    private Question question;

    // Getters and Setters
}