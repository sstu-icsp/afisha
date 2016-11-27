package org.epl.service;

import org.epl.dao.UserDao;
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

    public void saveUser(User user) {
        dao.saveUser(user);
    }

    public void updateUser(User user) {
        User entity = dao.findById(user.getId());
        entity.setNickname(user.getNickname());
        entity.setImage(user.getImage());
        entity.setBirthDate(user.getBirthDate());
        entity.setCity(user.getCity());
        entity.setEmail(user.getEmail());
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
}
