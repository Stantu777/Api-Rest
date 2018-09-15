package me.draku.genesis;

import me.draku.genesis.auth.service.AuthenticationService;
import me.draku.genesis.auth.service.AuthenticationServiceImpl;
import me.draku.genesis.permissions.RoleManager;
import me.draku.genesis.permissions.RoleManagerImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import javax.validation.Validator;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class GenesisApplication {
    public static void main(String[] args) {
        SpringApplication.run(GenesisApplication.class, args);
    }

    @Bean
    public Validator localValidatorFactoryBean() {
        return new LocalValidatorFactoryBean();
    }

    @Bean
    public RoleManager roleManagerBean() {
        return new RoleManagerImpl();
    }

    @Bean
    public AuthenticationService authServiceBean() {
        return new AuthenticationServiceImpl();
    }
}
