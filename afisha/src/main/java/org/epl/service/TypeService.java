package org.epl.service;

import java.util.List;

import org.epl.model.TypeOfEvents;

public interface TypeService {
    TypeOfEvents findById(int id);
    void saveType(TypeOfEvents typeOfEvents);
    void updateType(TypeOfEvents typeOfEvents);
    void deleteTypeById(int id);
    List <TypeOfEvents> findAllType();
}
