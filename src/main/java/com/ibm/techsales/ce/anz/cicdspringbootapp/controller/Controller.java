package com.ibm.techsales.ce.anz.cicdspringbootapp.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping("/welcome")
    public String welcome(Model model) {
        model.addAttribute("Team", " David, Marwan, Langley, Tony");
        return "welcome";
    }
}
