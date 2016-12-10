package org.epl.controller;

import org.epl.model.User;
import org.epl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
    @Autowired
    UserService userService;

    @RequestMapping("/profile/{name}")
    public String profile(@PathVariable("name") String name, ModelMap map) {
        map.addAttribute("user", userService.findByName(name));
        return "profile";
    }
}
