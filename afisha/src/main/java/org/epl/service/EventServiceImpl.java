package org.epl.service;

import java.util.List;

import javax.transaction.Transactional;

import org.epl.dao.EventDao;
import org.epl.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDao dao;
	public Event findById(int id) {
		
		return dao.findById(id);
	}

	public void saveEvent(Event event) {
		dao.saveEvent(event);

	}

	public void updateEvent(Event event) {
		Event entity=dao.findById(event.getId());
		entity.setCity(event.getCity());
		entity.setCoords(event.getCoords());
		entity.setDate(event.getDate());
		entity.setDescription(event.getDescription());
		entity.setImage(event.getImage());
		entity.setTitle(event.getTitle());
		entity.setType(event.getType());
		entity.setUser(event.getUser());
	}

	public void deleteEventById(int id) {
		dao.deleteEventById(id);
	}

	public List<Event> findAllEvent() {
		return dao.findAllEvent();
	}
}
