package org.epl.service;

import java.util.List;

import javax.transaction.Transactional;

import org.epl.dao.TypeDao;
import org.epl.model.TypeOfEvents;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeDao dao;
    public TypeOfEvents findById(int id) {
        return dao.findById(id);
    }

    public void saveType(TypeOfEvents typeOfEvents) {
        dao.saveType(typeOfEvents);
    }

    public void updateType(TypeOfEvents typeOfEvents) {
        TypeOfEvents entity=dao.findById(typeOfEvents.getId());
        entity.setTitle(typeOfEvents.getTitle());
    }

    public void deleteTypeById(int id) {
        dao.deleteTypeById(id);
    }

    public List<TypeOfEvents> findAllType() {

        return dao.findAllType();
    }

}
