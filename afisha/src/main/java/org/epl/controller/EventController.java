package org.epl.controller;

import org.epl.model.Event;
import org.epl.model.Image;
import org.epl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

@Controller
public class EventController {
    @Autowired
    private CityService cityService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private EventService eventService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private UserService userService;

    @RequestMapping(value={"/new"}, method = RequestMethod.GET)
    public String newEvent(ModelMap model)
    {
        model.addAttribute("event", new Event());
        model.addAttribute("types", typeService.findAllType());
        model.addAttribute("cities", cityService.findAllCity());
        return "new";
    }

    @RequestMapping(value = {"/new"}, headers = "Content-Type=multipart/form-data", method = RequestMethod.POST)
    public String saveEvent(@RequestParam("eventimg") MultipartFile file, @Valid Event event, BindingResult result, ModelMap model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("event", event);
            model.addAttribute("types", typeService.findAllType());
            model.addAttribute("cities", cityService.findAllCity());
            return "new";
        }

        if (!file.isEmpty()) {
            Image image = new Image();
            image.setData(file.getBytes());
            imageService.saveImage(image);
            event.setImage(image);
        }

        event.setCity(cityService.findById(event.getCityId()));
        event.setType(typeService.findById(event.getTypeId()));
        event.setCreator(userService.findById(event.getCreatorId()));
        eventService.saveEvent(event);
        return "redirect:/";
    }
}
