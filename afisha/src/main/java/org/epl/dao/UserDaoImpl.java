package org.epl.dao;

import org.epl.model.User;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

    public User findById(int id) {
        return getByKey(id);
    }

    public void saveUser(User user) {
        persist(user);
    }

    public void deleteUserById(int id) {
        delete(findById(id));
    }

    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria=createEntityCriteria();
        return (List <User>) criteria.list();
    }
}
