package model.exam.student;

import java.util.List;

import jakarta.json.bind.annotation.JsonbProperty;

public class ExamChoice {
    @JsonbProperty("studentExamId")
    private int studentExamId;
    @JsonbProperty("answers")
    private List<StudentChoice> studentChoices;

    public ExamChoice() {
    }

    public ExamChoice(int studentExamId, List<StudentChoice> studentChoices) {
        this.studentExamId = studentExamId;
        this.studentChoices = studentChoices;
    }

    public int getStudentExamId() {
        return studentExamId;
    }

    public void setStudentExamId(int studentExamId) {
        this.studentExamId = studentExamId;
    }

    public List<StudentChoice> getStudentChoices() {
        return studentChoices;
    }

    public void setStudentChoices(List<StudentChoice> studentChoices) {
        this.studentChoices = studentChoices;
    }

}
