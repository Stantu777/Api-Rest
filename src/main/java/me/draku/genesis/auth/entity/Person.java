package me.draku.genesis.auth.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import me.draku.genesis.thesis.entity.Thesis;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(schema = "Genesis", name = "Person")
public final class Person implements Serializable {
    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "id_type")
    private short idType;

    @Column(name = "first_name", columnDefinition = "NVARCHAR")
    private String firstName;

    @Column(name = "last_name", columnDefinition = "NVARCHAR")
    private String lastName;

    @Column(name = "age")
    private short age;

    @Column(name = "sex")
    private short sex;

    @Column(name = "address", columnDefinition = "NVARCHAR")
    private String address;

    @Column(name = "email", columnDefinition = "NVARCHAR")
    private String email;

    @Column(name = "phone", columnDefinition = "NVARCHAR")
    private String phone;

    @OneToOne(fetch = FetchType.EAGER, optional = true)
    private School school;

    @JsonIgnore
    @OneToOne(mappedBy = "person", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
    private Account account;

    @JsonIgnore
    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "active_thesis_id")
    private Thesis activeThesis;

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

    public Person() {}

    public Person(
            final long id,
            final short idType,
            final String firstName,
            final String lastName,
            final short age,
            final short sex,
            final School school,
            final String address,
            final String email,
            final String phone
    ) {
        this.id = id;
        this.idType = idType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.sex = sex;
        this.school = school;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public short getIdType() {
        return idType;
    }

    public void setIdType(short idType) {
        this.idType = idType;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public short getAge() {
        return age;
    }

    public void setAge(short age) {
        this.age = age;
    }

    public short getSex() {
        return sex;
    }

    public void setSex(short sex) {
        this.sex = sex;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Account getAccount() {
        return account;
    }

    public Thesis getActiveThesis() {
        return activeThesis;
    }

    public void setActiveThesis(Thesis activeThesis) {
        this.activeThesis = activeThesis;
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
