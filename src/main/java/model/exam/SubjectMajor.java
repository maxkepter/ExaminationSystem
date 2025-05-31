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

@Entity
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
}

@Embeddable
class SubjectMajorId implements Serializable {
    private Integer majorId;
    private Integer subID;

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        SubjectMajorId that = (SubjectMajorId) o;
        return Objects.equals(majorId, that.majorId) &&
                Objects.equals(subID, that.subID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(majorId, subID);
    }

}