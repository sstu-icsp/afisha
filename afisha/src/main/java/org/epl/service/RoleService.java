package org.epl.service;

import org.epl.model.Role;

import java.util.List;

public interface RoleService {
    Role findById(int id);
    Role findByName(String name);
    List<Role> findAllRoles();
}
