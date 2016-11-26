package org.epl.controller;

import java.util.Enumeration;
import java.util.List;

import org.epl.dao.ImageDao;
import org.epl.model.Event;
import org.epl.service.CityService;
import org.epl.service.EventService;
import org.epl.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class IndexController {
	@Autowired
	private EventService service;
	@Autowired
	private CityService cityService;
	@Autowired
	private TypeService typeService;

	@RequestMapping(value={"/","/event","/event/list"})
	public String index(ModelMap model)
	{
		model.addAttribute("events", service.findAllEvent());
		return "index";

	}

	@RequestMapping(value={"/createEvent"})
	public String viewCreateEvent(ModelMap model)
	{
		model.addAttribute("eventForm", new Event());
		model.addAttribute("types", typeService.findAllType());
		model.addAttribute("cities", cityService.findAllCity());
		return "createEvent";

	}

	@RequestMapping(value={"/createEvent"}, method = RequestMethod.POST)
	public String CreateEvent(@Valid @ModelAttribute("eventForm") Event eventForm,
							  BindingResult result, ModelMap model)
	{
		if (result.hasErrors()) {
			return "createEvent";
		}

		return "index";

	}

}
