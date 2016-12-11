package org.epl.controller;

import org.epl.model.Comment;
import org.epl.model.Event;
import org.epl.model.User;
import org.epl.service.CommentService;
import org.epl.service.EventService;
import org.epl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
public class CommentController {
    @Autowired
    CommentService commentService;
    @Autowired
    EventService eventService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/new_comment", method = RequestMethod.POST)
    @SuppressWarnings("unchecked")
    public ResponseEntity addComment(@RequestParam int eventId,
                                     @RequestParam String userCreator,
                                     @RequestParam String comment) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken) &&
                userCreator.equals(auth.getName())) { // check user auth
            User user = userService.findByName(userCreator);
            Event event = eventService.findById(eventId);
            Comment com = new Comment();
            com.setUser(user);
            com.setEvent(event);
            com.setComment(comment);
            commentService.saveComment(com);
            return new ResponseEntity(HttpStatus.OK);
        }
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }
}
