package org.epl.service;

import java.util.List;

import org.epl.model.Type;

public interface TypeService {
    Type findById(int id);
    void saveType(Type type);
    void updateType(Type type);
    void deleteTypeById(int id);
    List <Type> findAllType();
}
