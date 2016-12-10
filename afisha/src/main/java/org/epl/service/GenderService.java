package org.epl.service;

import org.epl.model.Gender;

import java.util.List;

public interface GenderService {
    Gender findById(int id);
    List<Gender> findAllGender();
}
