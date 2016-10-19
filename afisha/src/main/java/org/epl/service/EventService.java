package org.epl.service;

import java.util.List;

import org.epl.model.Event;

public interface EventService {
	Event findById(int id);
	void saveEvent(Event event);
	void updateEvent(Event event);
	void deleteEventById(int id);
	List <Event> findAllEvent();
}
