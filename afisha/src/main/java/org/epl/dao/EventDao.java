package org.epl.dao;

import java.util.Date;
import java.util.List;

import org.epl.model.Event;

public interface EventDao {
	Event findById(int id);
	void saveEvent(Event event);
	void deleteEventById(int id);
	List <Event> findAllEvent();
	List <Event> findByTitle(String title);
	List <Event> findByDate(Date date);
	List<Event> findByTypeId(int id);
}
