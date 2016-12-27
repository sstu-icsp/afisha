package org.epl.controller;

import javassist.tools.web.BadHttpRequest;
import org.epl.model.Rating;
import org.epl.model.User;
import org.epl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {

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

    @RequestMapping("/profile/{name}")
    public String profile(@PathVariable("name") String name, ModelMap model) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            User user = userService.findByName(auth.getName());
            if(!user.getNickName().equals(name))return "redirect:/";

            model.addAttribute("user", user);
        }
        model.addAttribute("cities",cityService.findAllCity());
        return "profile";
    }
}
