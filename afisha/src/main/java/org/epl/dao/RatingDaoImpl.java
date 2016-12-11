package org.epl.dao;

import org.springframework.stereotype.Repository;
import org.epl.model.Rating;
import org.hibernate.Criteria;

import java.util.List;

@Repository
public class RatingDaoImpl extends AbstractDao<Integer, Rating>  implements RatingDao {

    @Override
    public Rating findById(int id) {
        return findById(id);
    }

    @Override
    public void saveRating(Rating rating) {
        persist(rating);
    }

    @Override
    public void deleteRatingById(int id) {
        delete(findById(id));
    }

    @Override
    public List<Rating> findAllRatings() {
        Criteria criteria=createEntityCriteria();
        return (List <Rating>) criteria.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Rating> findRatingsByUser(int userId) {
        return (List<Rating>)getSession().createQuery("FROM Rating r WHERE r.user.id = " + Integer.toString(userId));
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Rating> findRatingsByEvent(int eventId) {
        return (List<Rating>)getSession().createQuery("FROM Rating r WHERE r.event.id = " + Integer.toString(eventId));
    }
}
