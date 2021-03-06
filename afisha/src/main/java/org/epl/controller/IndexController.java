package org.epl.controller;

import java.util.List;

import org.epl.model.Event;
import org.epl.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@Autowired
	private EventService service;
	
	@RequestMapping(value={"/","/event","/event/list"})
	public String index(ModelMap model)
	{
		
		model.addAttribute("Event", service.findById(1));
		return "index";
		
	}

}
