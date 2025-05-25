/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;

@Entity
public class Choice {
    @EmbeddedId
    private ChoiceId id;

    @ManyToOne
    @MapsId("optionId")
    @JoinColumn(name = "optionId")
    private QuestionOption option;

    @ManyToOne
    @MapsId("questionInExamId")
    @JoinColumn(name = "questionInExamId")
    private QuestionInExam questionInExam;
}

@Embeddable
class ChoiceId implements Serializable {
    private Integer optionId;
    private Integer questionInExamId;
}