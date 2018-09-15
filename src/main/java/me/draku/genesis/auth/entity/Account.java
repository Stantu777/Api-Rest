package me.draku.genesis.auth.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;

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
}
