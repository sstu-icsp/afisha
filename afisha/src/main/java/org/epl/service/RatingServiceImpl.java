package org.epl.service;

import org.epl.dao.RatingDao;
import org.epl.model.Rating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RatingServiceImpl implements RatingService {
    
    @Autowired
    RatingDao dao;

    @Override
    public Rating findById(int id) {
        return dao.findById(id);
    }

    @Override
    public void saveRating(Rating rating) {
        dao.saveRating(rating);
    }

    @Override
    public void updateRating(Rating rating) {
        Rating entity = dao.findById(rating.getId());
        entity.setEventId(rating.getEventId());
        entity.setUserId(rating.getUserId());
        entity.setRating(rating.getRating());
    }

    @Override
    public void deleteRatingById(int id) {
        dao.deleteRatingById(id);
    }

    @Override
    public List<Rating> findAllRatings() {
        return dao.findAllRatings();
    }

    @Override
    public List<Rating> findRatingsByUser(int userId) {
        return dao.findRatingsByUser(userId);
    }

    @Override
    public List<Rating> findRatingsByEvent(int eventId) {
        return dao.findRatingsByEvent(eventId);
    }
}
