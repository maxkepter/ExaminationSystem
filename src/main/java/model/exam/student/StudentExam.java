/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam.student;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import model.exam.Exam;
import model.user.Student;

@Entity
@Table(name = "StudentExam")
public class StudentExam {
    public static final int EXAM_CLOSED = 0;
    public static final int EXAM_DONE = 1;
    public static final int EXAM_DOING = 2;
    public static final int EXAM_SUSPENDED = 3;
    public static final String[] EXAM_STATUS_INFO = { "Exam closed", "Exam done", "Exam doing", "Exam suspended" };
    @Id
    @Column(nullable = false)
    private int studentExamID;

    @Column(nullable = false)
    private int examStatus;

    @Column(nullable = false)
    private float score;

    @Column(nullable = false)
    private LocalDateTime submitTime;

    @Column(nullable = false)
    private LocalDateTime startTime;

    @Lob
    @Column(nullable = false, columnDefinition = "NVARCHAR(MAX)")
    @Convert(converter = ExamDetailConverter.class)
    private List<QuestionWithOptions> examDetail;

    @Lob
    @Column(nullable = false, columnDefinition = "NVARCHAR(MAX)")
    @Convert(converter = StudentChoiceConverter.class)
    private Map<Integer, Set<Integer>> studentChoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ExamID", nullable = false)
    private Exam exam;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID", nullable = false)
    private Student student;

    public StudentExam(int examStatus, float score, LocalDateTime submitTime, LocalDateTime startTime,
            List<QuestionWithOptions> examDetail, Map<Integer, Set<Integer>> studentChoice, Exam exam,
            Student student) {
        this.examStatus = examStatus;
        this.score = score;
        this.submitTime = submitTime;
        this.startTime = startTime;
        this.examDetail = examDetail;
        this.studentChoice = studentChoice;
        this.exam = exam;
        this.student = student;
    }

    public void calculatescore()
            throws ArithmeticException {
        if (examDetail.size() == 0) {
            throw new ArithmeticException();
        }
        float score = 0;
        int totalQuestions = examDetail.size();
        int correctAnswers = 0;
        for (QuestionWithOptions q : examDetail) {
            if (checkCorrect(q.getCorrectId(), studentChoice.get(q.getQuestionId()))) {
                correctAnswers++;
            }
        }
        System.out.println("correct:" + correctAnswers);
        System.out.println("total:" + totalQuestions);

        this.score = score * 10;
    }

    public int getStudentExamID() {
        return studentExamID;
    }

    public void setStudentExamID(int studentExamID) {
        this.studentExamID = studentExamID;
    }

    public int getExamStatus() {
        return examStatus;
    }

    public void setExamStatus(int examStatus) {
        this.examStatus = examStatus;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public LocalDateTime getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(LocalDateTime submitTime) {
        this.submitTime = submitTime;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public List<QuestionWithOptions> getExamDetail() {
        return examDetail;
    }

    public void setExamDetail(List<QuestionWithOptions> examDetail) {
        this.examDetail = examDetail;
    }

    public Map<Integer, Set<Integer>> getStudentChoice() {
        return studentChoice;
    }

    public void setStudentChoice(Map<Integer, Set<Integer>> studentChoice) {
        this.studentChoice = studentChoice;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    private static boolean checkCorrect(List<Integer> correct, Set<Integer> studentChoice) {
        System.out.println("correct:" + correct);
        System.out.println("choice:" + studentChoice);
        if (correct.size() != studentChoice.size()) {
            return false;
        }
        for (Integer id : correct) {
            if (!studentChoice.contains(id)) {
                return false;
            }
        }
        return true;
    }

    public void submitExam() throws ArithmeticException {
        this.setExamStatus(StudentExam.EXAM_DONE);
        this.setSubmitTime(LocalDateTime.now());
        this.calculatescore();
    }

}
