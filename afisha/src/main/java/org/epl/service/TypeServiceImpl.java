package org.epl.service;

import java.util.List;

import javax.transaction.Transactional;

import org.epl.dao.TypeDao;
import org.epl.model.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeDao dao;

    public Type findById(int id) {
        return dao.findById(id);
    }

    public void saveType(Type type) {
        dao.saveType(type);
    }

    public void updateType(Type type) {
        Type entity=dao.findById(type.getId());
        entity.setName(type.getName());
    }

    public void deleteTypeById(int id) {
        dao.deleteTypeById(id);
    }

    public List<Type> findAllType() {

        return dao.findAllType();
    }

}
