package org.epl.service;

import org.epl.dao.GenderDao;
import org.epl.model.Gender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GenderServiceImpl implements GenderService {
    @Autowired
    GenderDao genderDao;

    @Override
    public Gender findById(int id) {
        return genderDao.findById(id);
    }

    @Override
    public List<Gender> findAllGender() {
        return genderDao.findAllGender();
    }
}
