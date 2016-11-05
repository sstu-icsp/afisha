package org.epl.dao;

import org.epl.model.City;

import java.util.List;

public interface CityDao {
	City findById(int id);
	void saveCity(City type);
	void deleteCityById(int id);
	List <City> findAllCity ();
}
