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
