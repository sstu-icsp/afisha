package org.epl.service;

import org.epl.model.City;

import java.util.List;

public interface CityService {
    City findById(int id);
    void saveCity(City city);
    void updateCity(City city);
    void deleteCityById(int id);
    List <City> findAllCity();
}
