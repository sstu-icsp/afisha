package org.epl.dao;

import org.epl.model.City;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CityDaoImpl extends AbstractDao<Integer, City> implements CityDao {

	public City findById(int id) {
		return	getByKey(id);
	}

	public void saveCity(City city) {
		persist(city);
	}

	public void deleteCityById(int id) {
		delete(findById(id));
	}

	@SuppressWarnings("unchecked")
	public List<City> findAllCity() {
		Criteria criteria=createEntityCriteria();
		return (List <City>) criteria.list();
	}
}
