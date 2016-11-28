package org.epl.dao;

import java.util.List;

import org.epl.model.Event;

public interface EventDao {
	Event findById(int id);
	void saveEvent(Event event);
	void deleteEventById(int id);
	List <Event> findAllEvent();
}
