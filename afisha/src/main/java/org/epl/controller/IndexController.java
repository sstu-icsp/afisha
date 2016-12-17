package org.epl.controller;

import org.epl.model.Event;
import org.epl.model.Rating;
import org.epl.service.EventService;
import org.epl.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {
	@Autowired
	private EventService service;
	@Autowired
	private RatingService ratingService;
	@RequestMapping(value={"/","/event","/event/list"})
	public String index(ModelMap model)
	{
		List<Rating> ratings = ratingService.findAllRatings();
		List<Event> events = service.findAllEvent();

		for (Event event : events) {
			int sumRating = 0;
			int ratingCnt = 0;
			for (Rating rating : ratings) {
				if (event.getId() == rating.getEventId()) {
					sumRating += rating.getRating();
					ratingCnt++;
				}
			}
			if (ratingCnt > 0)
				sumRating = sumRating / ratingCnt;
			event.setRating(sumRating);
		}

		model.addAttribute("events", events);
		return "index";
	}
}
