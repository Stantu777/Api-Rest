package me.draku.genesis.auth.service;

import me.draku.genesis.auth.entity.Account;
import me.draku.genesis.auth.repository.PersonRepository;
import me.draku.genesis.auth.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.util.Optional;

public final class AuthenticationServiceImpl implements AuthenticationService {
    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private AccountRepository accountRepository;

    public Optional<Account> authenticate(String email, String password) {
        final Optional<Account> account = this.accountRepository.findFirstByEmail(email);

        if (!account.isPresent()) {
            return Optional.empty();
        }

        return Optional.ofNullable(this.checkPassword(account.get(), password) ? account.get() : null);
    }

    public String securePassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    private boolean checkPassword(Account account, String password) {
        return BCrypt.checkpw(password, account.getPassword());
    }
}
/*
package me.draku.genesis.auth.repository;

import me.draku.genesis.auth.entity.Account;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.Optional;

@Repository
@Transactional
public class UserRepositoryImpl implements AccountRepository {
    private final EntityManager entityManager;

    private final JpaEntityInformation<Account, ?> entityInformation;

    public UserRepositoryImpl(JpaEntityInformation<Account, ?> entityInformation, EntityManager entityManager) {
        Assert.notNull(entityInformation, "JpaEntityInformation must not be null!");
        Assert.notNull(entityManager, "EntityManager must not be null!");

        this.entityInformation = entityInformation;
        this.entityManager = entityManager;
    }

    public Optional<Account> findById(long id) {
        return null;
    }

    public Optional<Account> findByEmail(String email) {
        return null;
    }

    public boolean checkPassword(Account user, String password) {
        return BCrypt.checkpw(user.getPassword(), password);
    }

    @Transactional
    public Account save(Account user) {
        if (this.entityInformation.isNew(user)) {
            this.entityManager.persist(user);
            return user;
        }

        return this.entityManager.merge(user);
    }
}
 */
