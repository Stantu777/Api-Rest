package me.draku.genesis.auth.entity;

import javax.persistence.*;

@Entity
@Table(schema = "Genesis", name = "Account")
public final class Account {
    @Id
    @Column(name = "id")
    private long id;

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
