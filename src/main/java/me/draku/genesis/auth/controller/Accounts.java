package me.draku.genesis.auth.controller;

import me.draku.genesis.auth.repository.AccountRepository;
import me.draku.genesis.auth.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/accounts")
public class Accounts {
    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PersonRepository personRepository;

    @CrossOrigin
    @GetMapping(value = "/{id}", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> getSingleById(final @PathVariable(value = "id") String id) {
        // This endpoint must only be access by authenticated users
        // Add token handler soon
        final long accountId;
        try {
            accountId = Long.parseLong(id);
        }
        catch (NumberFormatException e) {
            return ResponseEntity.badRequest().build();
        }

        return personRepository
                .findById(accountId)
                .map(person -> ResponseEntity.ok().body(person))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }

    @CrossOrigin
    @GetMapping(value = "/exists", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> doesPersonExist(
            final @RequestParam(value = "id", required = false) String id,
            final @RequestParam(value = "email", required = false) String email
    ) {
        if (id == null && email == null) {
            return ResponseEntity.badRequest().build();
        }

        if (email != null) {
            return personRepository.findByEmail(email)
                    .map(account -> ResponseEntity.ok().body(true))
                    .orElseGet(() -> ResponseEntity.ok().body(false));
        }

        final long personId;

        try {
            personId = Long.parseLong(id);
        }
        catch (NumberFormatException e) {
            return ResponseEntity.badRequest().build();
        }

        return personRepository.findById(personId)
                .map(person -> ResponseEntity.ok().body(true))
                .orElseGet(() -> ResponseEntity.ok().body(false));
    }
}
