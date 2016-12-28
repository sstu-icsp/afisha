package org.epl.controller;

import org.epl.model.Event;
import org.epl.model.Image;
import org.epl.model.Rating;
import org.epl.model.User;
import org.epl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

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
    @Autowired
    private CommentService commentService;
    @Autowired
    private RatingService ratingService;

    @RequestMapping(value = "/event/{id}", method = RequestMethod.GET)
    public String getEvent(@PathVariable int id, ModelMap model) {
        model.addAttribute("types", typeService.findAllType());
        Event event = eventService.findById(id);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            User user = userService.findByName(auth.getName());
            Rating rating = ratingService.findRatingsByUserEvent(id, auth.getName());
            if (rating != null)
                event.setUserRating(rating.getRating());
            model.addAttribute("user", user);
            System.out.println(user.getNickName());
        }
        model.addAttribute("event", event);
        model.addAttribute("comments", commentService.findCommentsByEvent(id));
        return "event";
    }

    @RequestMapping(value = {"/new/**"}, method = RequestMethod.GET)
    public String newEvent(ModelMap model) {
        model.addAttribute("event", new Event());
        model.addAttribute("types", typeService.findAllType());
        model.addAttribute("cities", cityService.findAllCity());
        return "new";
    }

    @RequestMapping(value = {"/new/**"}, headers = "Content-Type=multipart/form-data", method = RequestMethod.POST)
    public String saveEvent(@RequestParam("eventimg") MultipartFile file, @Valid Event event, BindingResult result, ModelMap model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("event", event);
            model.addAttribute("types", typeService.findAllType());
            model.addAttribute("cities", cityService.findAllCity());
            return "new";
        }

        if (!file.isEmpty()) {
            Image img = new Image(file.getBytes());
            imageService.saveImage(img);
            event.setImage(img);
        }

        event.setCity(cityService.findById(event.getCityId()));
        event.setType(typeService.findById(event.getTypeId()));
        event.setCreator(userService.findByName(event.getCreatorName()));
        eventService.saveEvent(event);
        return "redirect:/";
    }
}
