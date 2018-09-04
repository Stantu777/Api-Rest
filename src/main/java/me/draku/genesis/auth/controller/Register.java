package me.draku.genesis.auth.controller;

import me.draku.genesis.auth.data.RegisterForm;
import me.draku.genesis.auth.entity.Account;
import me.draku.genesis.auth.entity.Person;
import me.draku.genesis.auth.repository.AccountRepository;
import me.draku.genesis.auth.repository.PersonRepository;
import me.draku.genesis.auth.service.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
public final class Register {
    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AuthenticationService authenticator;

    @CrossOrigin
    @PostMapping(value = "register", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> post(final @RequestBody @Valid RegisterForm registerForm, final BindingResult result) {
        if (result.hasErrors()) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        if (this.accountRepository.findById(registerForm.getId()).isPresent()) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        final Person person = new Person(registerForm.getId(), registerForm.getIdType(), registerForm.getFirstName(),
                registerForm.getLastName(), registerForm.getAge(), registerForm.getSex(), registerForm.getAddress(),
                registerForm.getEmail(), registerForm.getPhone());

        final Account account = new Account(person, this.authenticator.securePassword(registerForm.getPassword()));

        return new ResponseEntity<>(this.accountRepository.save(account).getPerson(), HttpStatus.OK);
    }
}
