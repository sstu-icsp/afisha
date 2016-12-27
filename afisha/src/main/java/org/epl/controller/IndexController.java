package org.epl.controller;

import org.epl.service.EventService;
import org.epl.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@Autowired
	private EventService service;
	@Autowired
	private TypeService typeService;

	@RequestMapping(value={"/","/event","/event/list"})
	public String index(ModelMap model)
	{
		model.addAttribute("events", service.findAllEvent());
		model.addAttribute("types", typeService.findAllType());
		return "index";
	}
}
