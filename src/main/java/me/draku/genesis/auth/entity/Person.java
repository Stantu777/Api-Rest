package me.draku.genesis.auth.entity;

import javax.persistence.*;
import java.io.Serializable;

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
    private boolean sex;

    @Column(name = "address", columnDefinition = "NVARCHAR")
    private String address;

    @Column(name = "email", columnDefinition = "NVARCHAR")
    private String email;

    @Column(name = "phone", columnDefinition = "NVARCHAR")
    private String phone;

    @OneToOne(mappedBy = "person", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
    private Account account;

    public Person() {}

    public Person(final long id, final short idType, final String firstName, final String lastName, final short age,
                  final boolean sex, final String address, final String email, final String phone) {
        this.id = id;
        this.idType = idType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.sex = sex;
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

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
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
}
