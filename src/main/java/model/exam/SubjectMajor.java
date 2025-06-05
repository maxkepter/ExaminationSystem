/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "SubjectMajor")
public class SubjectMajor {
    @EmbeddedId
    private SubjectMajorId id;

    @ManyToOne
    @MapsId("majorId")
    @JoinColumn(name = "majorId")
    private Major major;

    @ManyToOne
    @MapsId("subID")
    @JoinColumn(name = "subID")
    private Subject subject;

    // Getters and Setters
}

@Embeddable
class SubjectMajorId implements Serializable {
    private int majorId;
    private int subID;

    public SubjectMajorId() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (!(o instanceof SubjectMajorId))
            return false;
        SubjectMajorId that = (SubjectMajorId) o;
        return majorId == that.majorId && subID == that.subID;
    }

    @Override
    public int hashCode() {
        return Objects.hash(majorId, subID);
    }
}