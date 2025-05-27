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
public class QuestionOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer optionId;

    @Lob
    @Column(name = "OptionConent", columnDefinition = "VARCHAR(MAX)", nullable = false)
    private String optionConent;

    @Column(nullable = false)
    private Boolean isCorrect;

    @Column(nullable = false)
    private Boolean isDisable;

    @ManyToOne
    @JoinColumn(name = "questionId", nullable = false)
    private Question question;
}