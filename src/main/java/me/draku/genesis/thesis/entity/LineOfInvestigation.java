package me.draku.genesis.thesis.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import me.draku.genesis.auth.entity.School;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(schema = "Genesis", name = "LineOfInvestigation")
public final class LineOfInvestigation implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_lineofinvestigation_id")
    @SequenceGenerator(name = "seq_lineofinvestigation_id", sequenceName = "seq_lineofinvestigation_id")
    private int id;

    @Column(name = "description", columnDefinition = "NVARCHAR")
    private String description;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "school_id")
    private School school;

    @JsonIgnore
    @Column(name = "is_deleted")
    private boolean deleted;

    @JsonIgnore
    @Column(name = "created_at", columnDefinition = "DATETIMEOFFSET(0)")
    private Date createdAt;

    @JsonIgnore
    @Column(name = "updated_at", columnDefinition = "DATETIMEOFFSET(0)")
    private Date updatedAt;

    @JsonIgnore
    @Column(name = "deleted_at", columnDefinition = "DATETIMEOFFSET(0)")
    private Date deletedAt;

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Date deletedAt) {
        this.deletedAt = deletedAt;
    }
}
