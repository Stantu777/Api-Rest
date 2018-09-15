package me.draku.genesis.permissions;

import java.util.Optional;

public interface RoleManager {
    Optional<Role> get(int id);

    boolean exists(int id);

    int getRolesAmount();
}
