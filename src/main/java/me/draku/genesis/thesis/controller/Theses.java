package me.draku.genesis.thesis.controller;

import me.draku.genesis.auth.repository.PersonRepository;
import me.draku.genesis.auth.token.Token;
import me.draku.genesis.auth.token.exception.InvalidToken;
import me.draku.genesis.thesis.data.RegisterThesisForm;
import me.draku.genesis.thesis.entity.Thesis;
import me.draku.genesis.thesis.repository.LineOfInvestigationRepository;
import me.draku.genesis.thesis.repository.ThesisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.function.Supplier;

@RestController
@RequestMapping("/theses")
public final class Theses {
    @Autowired
    private ThesisRepository thesisRepository;

    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private LineOfInvestigationRepository lineRepository;

    @CrossOrigin
    @PostMapping(value = "/new", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> createNew(
            final @RequestBody @Valid RegisterThesisForm registerThesisForm,
            final BindingResult result
    ) {
        // Remember to fetch the authorId from the token rather
        // than unmarshalling it from the payload
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().build();
        }

        return lineRepository
                .findById(registerThesisForm.getLineOfInvestigationId())
                .map(line -> personRepository
                        .findById(registerThesisForm.getAuthorId())
                        .map(person -> person.getActiveThesis() != null ? ResponseEntity.badRequest().build() : ResponseEntity.ok().body(
                                thesisRepository.save(
                                        ((Supplier<Thesis>)(() -> {
                                            final Thesis thesis = new Thesis();

                                            thesis.setAuthor(person);
                                            thesis.setTopic(registerThesisForm.getTopic());
                                            thesis.setDescription(registerThesisForm.getDescription());
                                            thesis.setLineOfInvestigation(line);
                                            person.setActiveThesis(thesis);

                                            return thesis;
                                        })).get()
                                ))
                        )
                        .orElseGet(() -> ResponseEntity.badRequest().build())
                )
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }

    @CrossOrigin
    @GetMapping(value = "/{id}", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> getThesis(
            final @PathVariable(value = "id") Integer id
    ) {
        return ResponseEntity.badRequest().build();
    }

    @CrossOrigin
    @GetMapping(value = "/@mine", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> getMyThesis(
            final @RequestHeader("Authorization") String authToken
    ) {
        final Token token;

        try {
            token = new Token(authToken);
        }
        catch (InvalidToken e) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        return personRepository
                .findById(token.getAccountId())
                .map(person -> ResponseEntity.ok().body(person.getActiveThesis()))
                .orElseGet(() -> ResponseEntity.badRequest().build());
    }
}
