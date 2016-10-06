package org.epl.dao;

import java.util.List;

import org.epl.model.Event;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class EventDaoImpl extends AbstractDao<Integer, Event> implements EventDao {

	public Event findById(int id) {
		return getByKey(id);
	}

	public void saveEvent(Event event) {
		persist(event);

	}

	public void deleteEventById(int id) {
		delete(findById(id));
	}

	@SuppressWarnings("unchecked")
	public List<Event> findAllEvent() {
		Criteria criteria=createEntityCriteria();
		return (List <Event>) criteria.list();
	}

}
