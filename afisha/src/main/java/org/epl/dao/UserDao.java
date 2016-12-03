package org.epl.dao;

import org.epl.model.User;

import java.util.List;

public interface UserDao {
    User findById(int id);
    User findByName(String name);
    void saveUser(User user);
    void deleteUserById(int id);
    List<User> findAllUsers();
}
