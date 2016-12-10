package org.epl.dao;

import org.epl.model.Gender;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GenderDaoImpl extends AbstractDao<Integer, Gender> implements GenderDao {
    @Override
    public Gender findById(int id) {
        return getByKey(id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Gender> findAllGender() {
        Criteria criteria=createEntityCriteria();
        return (List <Gender>) criteria.list();
    }
}
