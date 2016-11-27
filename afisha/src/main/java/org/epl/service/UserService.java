package org.epl.service;

import org.epl.model.User;

import java.util.List;

public interface UserService {
    User findById(int id);
    void saveUser(User user);
    void updateUser(User user);
    void deleteUserById(int id);
    List<User> findAllUsers();
}
