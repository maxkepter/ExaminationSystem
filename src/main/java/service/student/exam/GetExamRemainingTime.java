/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.student.exam;

import java.time.Duration;
import java.time.LocalDateTime;
import model.exam.student.StudentExam;

/**
 *
 * @author MasterLong
 */
public class GetExamRemainingTime {

    public static Duration getRemainingTime(StudentExam studentExam) {
        int examDuration = studentExam.getExam().getDuration();
        LocalDateTime startTime = studentExam.getStartTime();
        LocalDateTime endTime = startTime.plusMinutes(examDuration);
        // Get current time
        LocalDateTime now = LocalDateTime.now();

        // Calculate duration
        Duration duration = Duration.between(now, endTime);
        if (duration.isNegative()) {
            duration = Duration.ZERO;
        }
        
        return duration;
    }
}
