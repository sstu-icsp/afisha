package org.epl.dao;

import org.epl.model.Gender;

import java.util.List;

public interface GenderDao {
    Gender findById(int id);
    List<Gender> findAllGender();
}
