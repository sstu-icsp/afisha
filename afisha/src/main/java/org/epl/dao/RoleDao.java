package org.epl.dao;

import org.epl.model.Role;

import java.util.List;

public interface RoleDao {
    Role findById(int id);
    Role findByName(String name);
    List<Role> findAllRoles();
}
