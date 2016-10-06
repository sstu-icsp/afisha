package org.epl.dao;

import java.util.List;

import org.epl.model.Type;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class TypeDaoImpl extends AbstractDao<Integer, Type> implements TypeDao {

	public Type findById(int id) {
	return	getByKey(id);
		
	}

	public void saveType(Type type) {
		persist(type);

	}

	public void deleteTypeById(int id) {
		delete(findById(id));

	}

	@SuppressWarnings("unchecked")
	public List<Type> findAllType() {
		Criteria criteria=createEntityCriteria();
		return (List <Type>) criteria.list();
	}

}
