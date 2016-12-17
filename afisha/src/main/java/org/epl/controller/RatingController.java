package org.epl.controller;


import org.epl.model.Event;
import org.epl.model.Rating;
import org.epl.model.User;
import org.epl.service.CommentService;
import org.epl.service.EventService;
import org.epl.service.RatingService;
import org.epl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Леонид on 16.12.2016.
 */
@RestController
public class RatingController {
    @Autowired
    EventService eventService;
    @Autowired
    UserService userService;
    @Autowired
    RatingService ratingService;

    @RequestMapping(value = "/new_rating", method = RequestMethod.POST)
    @SuppressWarnings("unchecked")
    public ResponseEntity addRating(@RequestParam int eventId,
                                    @RequestParam String userCreator,
                                    @RequestParam int rating) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken) &&
                userCreator.equals(auth.getName())) { // check user auth
            Rating eventUserRating = ratingService.findRatingsByUserEvent(eventId, userCreator);
            if (eventUserRating != null) {
                eventUserRating.setRating(rating);
                ratingService.updateRating(eventUserRating);
                return new ResponseEntity(HttpStatus.OK);
            }
            User user = userService.findByName(userCreator);
            Event event = eventService.findById(eventId);
            Rating ratingEvent = new Rating();
            ratingEvent.setUser(user);
            ratingEvent.setEvent(event);
            ratingEvent.setRating(rating);
            ratingService.saveRating(ratingEvent);
            return new ResponseEntity(HttpStatus.OK);
        }
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }

    @RequestMapping(value = "/delete_rating", method = RequestMethod.POST)
    @SuppressWarnings("unchecked")
    public ResponseEntity deleteRating(@RequestParam int eventId,
                                       @RequestParam String userCreator) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken) &&
                userCreator.equals(auth.getName())) { // check user auth
            Rating eventUserRating = ratingService.findRatingsByUserEvent(eventId, userCreator);
            if (eventUserRating != null) {
                ratingService.deleteRatingById(eventUserRating.getId());
                return new ResponseEntity(HttpStatus.OK);
            }
        }
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
}

