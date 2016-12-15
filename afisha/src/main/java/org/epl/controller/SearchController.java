package org.epl.controller;

import org.epl.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Nodyke on 14.12.2016.
 */
@Controller
public class SearchController
{
    @Autowired private SearchService searchService;
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam String param, ModelMap model)
    {
        model.addAttribute("events", searchService.searchEvent(param));
        return "index";
    }
}
