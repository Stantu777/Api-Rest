package me.draku.genesis.auth.service;

import me.draku.genesis.auth.entity.Account;

import java.util.Optional;

public interface AuthenticationService {
    Optional<Account> authenticate(String email, String password);

    String securePassword(String password);
}
