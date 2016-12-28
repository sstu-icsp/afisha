package org.epl.controller;

import org.epl.model.Comment;
import org.epl.model.User;
import org.epl.service.*;
import org.hibernate.TypeMismatchException;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfileController {

    @Autowired
    private CityService cityService;
    @Autowired
    private GenderService genderService;
    @Autowired
    private UserService userService;

    @RequestMapping("/profile/{name}")
    public String profile(@PathVariable("name") String name, ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            User user = userService.findByName(auth.getName());
            if(!user.getNickName().equals(name))
                return "redirect:/";

            model.addAttribute("user", user);
        }
        model.addAttribute("cities",cityService.findAllCity());
        return "profile";
    }

    @RequestMapping("/profile_update")
    public ResponseEntity updateProfile(@RequestParam String fullName,
                                        @RequestParam String nickName,
                                        @RequestParam int genderId,
                                        @RequestParam String birthDate,
                                        @RequestParam int cityId) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken) &&
                nickName.equals(auth.getName())) { // check user auth
            User oldUser = userService.findByName(nickName);
            oldUser.setFullName(fullName);
            oldUser.setGender(genderService.findById(genderId));
            if ("".equals(birthDate))
                oldUser.setBirthDate(null);
            else {
                try {
                    oldUser.setBirthDate(LocalDate.parse(birthDate, DateTimeFormat.forPattern("dd/MM/yyyy")));
                } catch (IllegalArgumentException e) {
                    return new ResponseEntity(HttpStatus.BAD_REQUEST);
                }
            }
            oldUser.setCity(cityService.findById(cityId));
            userService.updateUser(oldUser);
            return new ResponseEntity(HttpStatus.ACCEPTED);
        }
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
}
