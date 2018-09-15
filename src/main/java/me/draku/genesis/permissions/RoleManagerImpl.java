package me.draku.genesis.permissions;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

public final class RoleManagerImpl implements RoleManager {
    private Map<Integer, Role> map;

    private int rolesAmount = 0;

    public RoleManagerImpl() {
        map = new ConcurrentHashMap<>();

        Role roles[] = {
                makeRole("Tesista"),
                makeRole("Secretaria de Grados y Títulos"),
                makeRole("Director de Grados y Títulos"),
                makeRole("Director de EPICS"),
                makeRole("Director de EPIC"),
                makeRole("Revisor de Instituto de Investigación")
        };

        for (Role role : roles) {
            map.put(role.getId(), role);
        }
    }

    public Optional<Role> get(int id) {
        return Optional.ofNullable(map.get(id));
    }

    public boolean exists(int id) {
        return map.containsKey(id);
    }

    public int getRolesAmount() {
        return rolesAmount;
    }

    private Role makeRole(String name) {
        return new Role(++rolesAmount, name);
    }
}
