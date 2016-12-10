package org.epl.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.epl.exception.UserExistsException;
import org.epl.model.Image;
import org.epl.model.User;
import org.epl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;

@Controller
public class RegistrationController {
    @Autowired
    ImageService imageService;
    @Autowired
    UserService userService;
    @Autowired
    CityService cityService;
    @Autowired
    GenderService genderService;
    @Autowired
    RoleService roleService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) { // if user has already logged in
            return "redirect:/";
        }
        model.addAttribute("cities", cityService.findAllCity());
        model.addAttribute("genders", genderService.findAllGender());
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/register", headers = "Content-Type=multipart/form-data", method = RequestMethod.POST)
    public String saveUser(@RequestParam("userimg") MultipartFile file,
                           @ModelAttribute("user") @Valid User user,
                           BindingResult result,
                           ModelMap model,
                           HttpServletRequest request) throws IOException, ServletException {
        user.setGender(genderService.findById(user.getGenderId()));
        user.setCity(cityService.findById(user.getCityId()));
        user.setRole(roleService.findByName("USER"));

        if (!file.isEmpty()) {
            Image img = new Image(file.getBytes());
            imageService.saveImage(img);
            user.setImage(img);
        }

        try {
            userService.saveUser(user);
        } catch (UserExistsException e) {
            result.rejectValue("nickName", "regError");
        }

        if (result.hasErrors()) {
            model.addAttribute("cities", cityService.findAllCity());
            model.addAttribute("genders", genderService.findAllGender());
            model.addAttribute("user", user);
            return "register";
        } else {
            request.login(user.getNickName(), user.getPassword()); // autologin
        }

        return "redirect:/";
    }
}
