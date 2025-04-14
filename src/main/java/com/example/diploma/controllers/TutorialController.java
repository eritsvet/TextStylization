package com.example.diploma.controllers;

import com.example.diploma.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TutorialController {
    private final UserService userService;

    @GetMapping("/tutorial")
    public String tutorial(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("currentPage", "tutorial");
        return "tutorial";
    }
} 