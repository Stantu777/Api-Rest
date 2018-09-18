package me.draku.genesis.thesis.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import me.draku.genesis.auth.entity.Person;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(schema = "Genesis", name = "Thesis")
public final class Thesis implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_thesis_id")
    @SequenceGenerator(name = "seq_thesis_id", sequenceName = "seq_thesis_id", schema = "Genesis", allocationSize = 1)
    private int id;

    @Column(name = "topic", columnDefinition = "NVARCHAR")
    private String topic;

    @Column(name = "description", columnDefinition = "NVARCHAR")
    private String description;

    @Column(name = "is_approved")
    private boolean approved;

    @Column(name = "is_archived")
    private boolean archived;

    @OneToOne(fetch = FetchType.EAGER, optional = true)
    @JoinColumn(name = "line_of_investigation_id")
    private LineOfInvestigation lineOfInvestigation;

    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "author_id")
    private Person author;

    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "partner_id")
    private Person partner;

    @JsonIgnore
    @Column(name = "is_deleted", insertable = false)
    private boolean deleted;

    @JsonIgnore
    @Column(name = "created_at", columnDefinition = "DATETIMEOFFSET(0)", insertable = false)
    private Date createdAt;

    @JsonIgnore
    @Column(name = "updated_at", columnDefinition = "DATETIMEOFFSET(0)", insertable = false)
    private Date updatedAt;

    @JsonIgnore
    @Column(name = "deleted_at", columnDefinition = "DATETIMEOFFSET(0)", insertable = false)
    private Date deletedAt;

    public Thesis() {}

    public int getId() {
        return id;
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

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

    public boolean isArchived() {
        return archived;
    }

    public void setArchived(boolean archived) {
        this.archived = archived;
    }

    public LineOfInvestigation getLineOfInvestigation() {
        return lineOfInvestigation;
    }

    public void setLineOfInvestigation(LineOfInvestigation lineOfInvestigation) {
        this.lineOfInvestigation = lineOfInvestigation;
    }

    public Person getAuthor() {
        return author;
    }

    public void setAuthor(Person author) {
        this.author = author;
    }

    public Person getPartner() {
        return partner;
    }

    public void setPartner(Person partner) {
        this.partner = partner;
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
