package me.draku.genesis.auth.controller;

import me.draku.genesis.auth.entity.Person;
import me.draku.genesis.auth.repository.PersonRepository;
import me.draku.genesis.auth.token.Token;
import me.draku.genesis.auth.token.exception.InvalidToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public final class Me {
    @Autowired
    private PersonRepository repository;

    @CrossOrigin
    @GetMapping(value = "/users/@me", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> get(final @RequestHeader("Authorization") String authToken) {
        final Token token;

        try {
            token = new Token(authToken);
        }
        catch (InvalidToken e) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        return repository.findById(token.getAccountId())
                .map(person -> ResponseEntity.ok().body(person))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }
}
