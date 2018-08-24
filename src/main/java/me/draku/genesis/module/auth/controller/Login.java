package me.draku.genesis.module.auth.controller;

import me.draku.genesis.module.auth.payload.Credential;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.Set;

@RestController
public class Login {
    @Autowired
    private Validator validator;

    @PostMapping(value = "login", consumes = "application/json", produces = "application/json")
    public Credential login(final @RequestBody Credential credential) {
        Set<ConstraintViolation<Credential>> constraintViolations = validator.validate(credential);
        ConstraintViolation<Credential> constraintViolation = constraintViolations.iterator().next();
        System.out.println(constraintViolation.getPropertyPath().toString() + " " + constraintViolation.getMessage());
        return credential;
    }
}
