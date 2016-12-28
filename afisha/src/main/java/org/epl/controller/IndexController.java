package org.epl.controller;

import org.epl.model.Event;
import org.epl.service.CityService;
import org.epl.service.EventService;
import org.epl.service.RatingService;
import org.epl.service.TypeService;
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
	@Autowired
	private TypeService typeService;
	@Autowired
	private CityService cityService;

	@RequestMapping(value={"/","/event","/event/list"})
	public String index(ModelMap model) {
		List<Event> events = service.findAllEvent();
		model.addAttribute("events", events);
		model.addAttribute("types", typeService.findAllType());
		model.addAttribute("cities", cityService.findAllCity());
		return "index";
	}
}
