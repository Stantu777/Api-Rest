package me.draku.genesis.auth.controller;

import me.draku.genesis.auth.entity.School;
import me.draku.genesis.auth.repository.SchoolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/schools")
public final class Schools {
    @Autowired
    private SchoolRepository repository;

    @CrossOrigin
    @GetMapping(consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> index() {
        return new ResponseEntity<>(repository.findAll(), HttpStatus.OK);
    }

    @CrossOrigin
    @GetMapping(value = "/{id}/lines", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> listLinesOfInvestigation(final @PathVariable(value = "id") String id) {
        final int schoolId;
        final Optional<School> school;

        try {
            schoolId = Integer.parseInt(id);
        }
        catch (NumberFormatException e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }

        school = repository.findById(schoolId);

        if (!school.isPresent()) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(school.get().getLinesOfInvestigation(), HttpStatus.OK);
    }
}
