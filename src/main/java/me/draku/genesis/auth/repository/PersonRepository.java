package me.draku.genesis.auth.repository;

import me.draku.genesis.auth.entity.Person;
import org.springframework.data.repository.CrudRepository;

public interface PersonRepository extends CrudRepository<Person, Long> {}
