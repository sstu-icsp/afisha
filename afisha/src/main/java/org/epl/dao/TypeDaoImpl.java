package org.epl.dao;

import java.util.List;

import org.epl.model.TypeOfEvents;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class TypeDaoImpl extends AbstractDao<Integer, TypeOfEvents> implements TypeDao {

	public TypeOfEvents findById(int id) {
	return	getByKey(id);
		
	}

	public void saveType(TypeOfEvents typeOfEvents) {
		persist(typeOfEvents);

	}

	public void deleteTypeById(int id) {
		delete(findById(id));

	}

	@SuppressWarnings("unchecked")
	public List<TypeOfEvents> findAllType() {
		Criteria criteria=createEntityCriteria();
		return (List <TypeOfEvents>) criteria.list();
	}

}
