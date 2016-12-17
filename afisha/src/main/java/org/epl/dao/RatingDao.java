package org.epl.dao;

import org.epl.model.Rating;

import java.util.List;

public interface RatingDao {
    Rating findById(int id);
    void saveRating(Rating rating);
    void deleteRatingById(int id);
    List<Rating> findAllRatings();
    List<Rating> findRatingsByUser(int userId);
    List<Rating> findRatingsByEvent(int eventId);
    Rating findRatingsByUserEvent(int eventId, String userName);
}
