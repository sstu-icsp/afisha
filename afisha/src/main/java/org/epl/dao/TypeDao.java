package org.epl.dao;

import java.util.List;

import org.epl.model.TypeOfEvents;

public interface TypeDao {
	TypeOfEvents findById(int id);
	void saveType(TypeOfEvents typeOfEvents);
	void deleteTypeById(int id);
	List <TypeOfEvents> findAllType();
}
