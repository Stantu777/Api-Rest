package me.draku.genesis.auth.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import me.draku.genesis.thesis.entity.LineOfInvestigation;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(schema = "Genesis", name = "School")
public final class School implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_school_id")
    @SequenceGenerator(name = "seq_school_id", sequenceName = "seq_school_id")
    private int id;

    @Column(name = "name", columnDefinition = "NVARCHAR")
    private String name;

    @Column(name = "address", columnDefinition = "NVARCHAR")
    private String address;

    @Column(name = "website", columnDefinition = "NVARCHAR")
    private String website;

    @Column(name = "phone", columnDefinition = "NVARCHAR")
    private String phone;

    @OneToOne(fetch = FetchType.EAGER, optional = true)
    private Person principal;

    @JsonIgnore
    @OneToMany(mappedBy = "school", fetch = FetchType.LAZY)
    private List<LineOfInvestigation> linesOfInvestigation;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Person getPrincipal() {
        return principal;
    }

    public void setPrincipal(Person principal) {
        this.principal = principal;
    }

    public List<LineOfInvestigation> getLinesOfInvestigation() {
        return linesOfInvestigation;
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
