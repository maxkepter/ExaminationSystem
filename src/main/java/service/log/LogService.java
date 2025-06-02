/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.log;

import model.log.LogStatus;
import model.user.User;

/**
 *
 * @author Admin
 */
public interface LogService {
    void createUserLog(User user, LogStatus logStatus);

}
