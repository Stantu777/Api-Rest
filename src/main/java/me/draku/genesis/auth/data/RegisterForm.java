package me.draku.genesis.auth.data;

import javax.validation.constraints.NotNull;

public final class RegisterForm {
    @NotNull
    private long id;

    @NotNull
    private short idType;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @NotNull
    private short age;

    @NotNull
    private boolean sex;

    @NotNull
    private String address;

    @NotNull
    private String email;

    @NotNull
    private String phone;

    @NotNull
    private String password;

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

    public boolean getSex() {
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
