package org.epl.service;

import org.epl.exception.UserExistsException;
import org.epl.model.User;

import java.util.List;

public interface UserService {
    User findById(int id);
    User findByName(String name);
    void saveUser(User user) throws UserExistsException;
    void updateUser(User user);
    void deleteUserById(int id);
    List<User> findAllUsers();
}
