package me.draku.genesis.auth.controller;

import me.draku.genesis.auth.data.Credential;
import me.draku.genesis.auth.entity.Account;
import me.draku.genesis.auth.service.AuthenticationService;
import me.draku.genesis.auth.token.SerializableToken;
import me.draku.genesis.auth.token.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.Valid;
import java.util.Optional;

@RestController
public final class Login {
    @Autowired
    private AuthenticationService authenticator;

    @CrossOrigin
    @PostMapping(value = "login", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> login(final @RequestBody @Valid Credential credential, final BindingResult result) {
        if (result.hasErrors()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        Optional<Account> account = this.authenticator.authenticate(credential.getEmail(), credential.getPassword());

        if (!account.isPresent()) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        Token token = new Token();

        token.setHash("testhash");
        token.setAccountId(account.get().getId());

        return new ResponseEntity<>(new SerializableToken(token), HttpStatus.OK);
    }
}
