package me.draku.genesis.auth.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(schema = "Genesis", name = "Account")
public final class Account implements Serializable {
    @Id
    @Column(name = "id")
    private long id;

    @JsonIgnore
    @Column(name = "password", columnDefinition = "NVARCHAR")
    private String password;

    @OneToOne(fetch = FetchType.EAGER)
    @MapsId
    private Person person;

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

    public Account() {}

    public Account(Person person, String password) {
        this.person = person;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Person getPerson() {
        return person;
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
