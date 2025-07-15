package model.log;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import model.exam.student.StudentExam;

@Entity
@Table(name = "ExamLog")
public class ExamLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int examLogId;

    @Column(nullable = false)
    private LocalDateTime time;

    @Column(nullable = false, length = 255)
    private String information;

    @ManyToOne
    @JoinColumn(name = "studentExamID", nullable = false)
    private StudentExam studentExam;

    public ExamLog(LocalDateTime time, String information, StudentExam studentExam) {
        this.time = time;
        this.information = information;
        this.studentExam = studentExam;
    }

    public ExamLog() {
    }

    public int getExamLogId() {
        return examLogId;
    }

    public void setExamLogId(int examLogId) {
        this.examLogId = examLogId;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public String getFormattedTime() {
        if (time == null) {
            return "";
        }
        return String.format("%02d/%d/%d - %d:%02d:%02d",
                time.getYear() % 100,
                time.getMonthValue(),
                time.getDayOfMonth(),
                time.getHour(),
                time.getMinute(),
                time.getSecond());
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public StudentExam getStudentExam() {
        return studentExam;
    }

    public void setStudentExam(StudentExam studentExam) {
        this.studentExam = studentExam;
    }

    @Override
    public String toString() {
        return "ExamLog [examLogId=" + examLogId + ", time=" + time + ", information=" + information + "]";
    }

}