package org.epl.service;

import org.epl.dao.UserDao;
import org.epl.exception.UserExistsException;
import org.epl.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    public User findById(int id) {
        return dao.findById(id);
    }

    @Override
    public User findByName(String name) {
        return dao.findByName(name);
    }

    public void saveUser(User user) throws UserExistsException {
        if (userRegistered(user.getNickName())) {
            throw new UserExistsException("There is an account with that nickname: " + user.getNickName());
        }
        dao.saveUser(user);
    }

    public void updateUser(User user) {
        User entity = dao.findById(user.getId());
        entity.setNickName(user.getNickName());
        entity.setFullName(user.getFullName());
        entity.setImage(user.getImage());
        entity.setBirthDate(user.getBirthDate());
        entity.setCity(user.getCity());
        entity.setGender(user.getGender());
        entity.setPassword(user.getPassword());
        entity.setRole(user.getRole());
    }

    public void deleteUserById(int id) {
        dao.deleteUserById(id);
    }

    public List<User> findAllUsers() {
        return dao.findAllUsers();
    }

    private boolean userRegistered(String username) {
        System.out.println("user registered: " + dao.findByName(username));
        return (dao.findByName(username) != null);
    }
}
