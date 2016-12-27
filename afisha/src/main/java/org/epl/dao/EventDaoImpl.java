package org.epl.dao;

import java.util.Date;
import java.util.List;
import java.util.Queue;

import org.epl.model.Comment;
import org.epl.model.Event;
import org.hibernate.Criteria;
import org.hibernate.Query;
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
	@Override
	public List<Event> findByTitle(String n)
	{

		Query query=getSession().createQuery("FROM Event c WHERE c.title LIKE :name");
		query.setParameter("name", "%"+n+"%");
		return query.list();


	}
	@Override
	public List<Event> findByDate(Date date)
	{
		return null;
		//return (List<Event>)getSession().createQuery("FROM Event c WHERE c.date="+date).list();
	}
	@Override
	public  List<Event> findByTypeId(int id)
	{
		Query query=getSession().createQuery("FROM  Event c WHERE  c.type.id = :id");
		query.setParameter("id",id);
		return query.list();
	}
}
