package me.draku.genesis.auth.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import me.draku.genesis.auth.repository.SchoolRepository;

@RestController
@RequestMapping("/schools")
public final class Schools {
    @Autowired
    private SchoolRepository repository;

    @CrossOrigin
    @GetMapping(consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> index() {
        return ResponseEntity.ok().body(repository.findAll());
    }

    @CrossOrigin
    @GetMapping(value = "/{id}/lines", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> listLinesOfInvestigation(final @PathVariable(value = "id") String id) {
        final int schoolId;

        try {
            schoolId = Integer.parseInt(id);
        }
        catch (NumberFormatException e) {
            return ResponseEntity.badRequest().build();
        }

        return repository
                .findById(schoolId)
                .map(school -> ResponseEntity.ok().body(school.getLinesOfInvestigation()))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }
}