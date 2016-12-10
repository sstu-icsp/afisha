package org.epl.service;

import org.epl.dao.CityDao;
import org.epl.model.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CityServiceImpl implements CityService {

    @Autowired
    private CityDao dao;

    public City findById(int id) {
        return dao.findById(id);
    }

    public void saveCity(City city) {
        dao.saveCity(city);
    }

    public void updateCity(City city) {
        City entity=dao.findById(city.getId());
        entity.setName(city.getName());
    }

    public void deleteCityById(int id) {
        dao.deleteCityById(id);
    }

    public List<City> findAllCity() {

        return dao.findAllCity();
    }
}
