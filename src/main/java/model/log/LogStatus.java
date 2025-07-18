/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.log;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class LogStatus {
    @Id
    private Integer statusId;

    @Column(nullable = false)
    private String status;

    public LogStatus(String status) {
        this.status = status;
    }

    public LogStatus(Integer statusId, String status) {
        this.statusId = statusId;
        this.status = status;
    }

    public LogStatus() {
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "LogStatus [statusId=" + statusId + ", status=" + status + "]";
    }

}