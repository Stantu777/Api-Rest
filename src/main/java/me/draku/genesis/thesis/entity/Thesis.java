package me.draku.genesis.thesis.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(schema = "Genesis", name = "Thesis")
public final class Thesis implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_thesis_id")
    @SequenceGenerator(name = "seq_thesis_id", sequenceName = "seq_thesis_id")
    private int id;

    @Column(name = "topic", columnDefinition = "NVARCHAR")
    private String topic;

    @Column(name = "description", columnDefinition = "NVARCHAR")
    private String description;

    @Column(name = "is_archived")
    private boolean archived;

    @JsonIgnore
    @Column(name = "is_deleted")
    private boolean deleted;

    @Column(name = "created_at", columnDefinition = "DATETIMEOFFSET(0)")
    private Date createdAt;

    @Column(name = "updated_at", columnDefinition = "DATETIMEOFFSET(0)")
    private Date updatedAt;

    @JsonIgnore
    @Column(name = "deleted_at", columnDefinition = "DATETIMEOFFSET(0)")
    private Date deletedAt;

    public Thesis() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isArchived() {
        return archived;
    }

    public void setArchived(boolean archived) {
        this.archived = archived;
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
