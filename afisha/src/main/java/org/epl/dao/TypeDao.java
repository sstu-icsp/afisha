package org.epl.dao;

import java.util.List;

import org.epl.model.Type;

public interface TypeDao {
	Type findById(int id);
	void saveType(Type type);
	void deleteTypeById(int id);
	List <Type> findAllType();
}
