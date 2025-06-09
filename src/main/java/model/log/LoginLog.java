/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.log;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import model.user.User;

@Entity
public class LoginLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer logId;

    @Column(nullable = false, columnDefinition = "DATETIME")
    private LocalDateTime time;

    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "statusId", nullable = false)
    private LogStatus status;

    public LoginLog(LocalDateTime time, User user, LogStatus status) {
        this.time = time;
        this.user = user;
        this.status = status;
    }

    public LoginLog() {
    }

    @Override
    public String toString() {
        return "LoginLog [logId=" + logId + ", time=" + time + ", user=" + user + ", status=" + status + "]";
    }

}