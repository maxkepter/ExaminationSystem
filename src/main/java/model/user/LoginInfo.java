/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToOne;
import model.log.LogStatus;
import utils.HashInfo;

@Entity
public class LoginInfo {
    @Id
    private Integer userID;

    @OneToOne(cascade = CascadeType.PERSIST)
    @MapsId
    @JoinColumn(name = "userID")
    private User user;

    @Column(name = "UserName", unique = true, nullable = false, length = 255)
    private String userName;

    @Column(nullable = false)
    private String password;

    @ManyToOne
    @JoinColumn(name = "statusId", nullable = false)
    private LogStatus status;

    public LoginInfo(Integer userID, User user, String userName, String password, LogStatus status) {
        this.userID = userID;
        this.user = user;
        this.userName = userName;
        this.password = password;
        this.status = status;
    }

    public LoginInfo() {
    }

    public Integer getUserID() {
        return userID;
    }

    public User getUser() {
        return user;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public LogStatus getStatus() {
        return status;
    }

    public static boolean checkPassword(LoginInfo loginInfo, String password) {
        return loginInfo.getPassword().compareTo(HashInfo.hash(password)) == 0;
    }

}