package org.epl.dao;

import org.epl.model.Role;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoleDaoImpl extends AbstractDao<Integer, Role> implements RoleDao {
    @Override
    public Role findById(int id) {
        return getByKey(id);
    }

    @Override
    public Role findByName(String name) {
        List<Role> result = getSession().createQuery("FROM Role u WHERE u.name = '"+name+"'").list();
        if (result.size() > 0) return result.get(0);
        return null;
    }

    @Override
    public List<Role> findAllRoles() {
        Criteria criteria=createEntityCriteria();
        return (List <Role>) criteria.list();
    }
}
