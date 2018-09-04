package me.draku.genesis.auth.repository;

import me.draku.genesis.auth.entity.Account;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface AccountRepository extends CrudRepository<Account, Long> {
    @Query("SELECT a FROM Account a JOIN Person p ON a.person = p.account WHERE p.email = :email")
    Optional<Account> findFirstByEmail(@Param("email") String email);
}
