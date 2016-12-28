package org.epl.service;

import java.util.List;


import org.epl.dao.EventDao;
import org.epl.model.Event;
import org.epl.model.Rating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EventServiceImpl implements EventService {
	@Autowired RatingService ratingService;
	@Autowired private EventDao dao;

	public Event findById(int id) {
		Event event = dao.findById(id);
		Rating.countEventRating(event, ratingService.findAllRatings());
		return event;
	}

	public void saveEvent(Event event) {
		dao.saveEvent(event);
	}

	public void updateEvent(Event event) {
		Event entity=dao.findById(event.getId());
		entity.setCoords(event.getCoords());
		entity.setData(event.getData());
		entity.setDescription(event.getDescription());
		entity.setImage(event.getImage());
		entity.setTitle(event.getTitle());
		entity.setCity(event.getCity());
	}

	public void deleteEventById(int id) {
		dao.deleteEventById(id);
	}

	public List<Event> findAllEvent() {
		List<Event> events = dao.findAllEvent();
		Rating.countEventsRating(events, ratingService.findAllRatings());
		return events;
	}

	@Override
	public List<Event> findByTitle(String title) {
		List<Event> events = dao.findByTitle(title);
		Rating.countEventsRating(events, ratingService.findAllRatings());
		return events;
	}

	@Override
	public List<Event> findByTypeId(int id) {
		List<Event> events = dao.findByTypeId(id);
		Rating.countEventsRating(events, ratingService.findAllRatings());
		return events;
	}
}
