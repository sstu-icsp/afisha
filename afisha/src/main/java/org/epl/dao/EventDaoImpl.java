package org.epl.dao;

import java.util.List;

import org.epl.model.Event;
import org.epl.model.Rating;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
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
		Criteria criteria = createEntityCriteria();
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Event> findByTitle(String n) {
		Query query=getSession().createQuery("FROM Event c WHERE c.title LIKE :name");
		query.setParameter("name", "%"+n+"%");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	public List<Event> findByTypeId(int id) {
		Query query=getSession().createQuery("FROM  Event c WHERE  c.type.id = :id");
		query.setParameter("id",id);
		return query.list();
	}
}
