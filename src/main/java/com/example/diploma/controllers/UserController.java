package com.example.diploma.controllers;

import com.example.diploma.models.User;
import com.example.diploma.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;


    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/profile")
    public String profile(String title, Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        String userEmail = user.getEmail();
        String userPassword = user.getPassword();
        
        // Email validation
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        if (!userEmail.matches(emailRegex)) {
            model.addAttribute("errorMessage", "Invalid email format");
            return "registration";
        }
        
        // Password length check
        if (userPassword == null || userPassword.length() > 4) {
            model.addAttribute("errorMessage", "Password must not exceed 4 characters");
            return "registration";
        }
        
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "User with email " + userEmail + " already exists");
            return "registration";
        }
        return "redirect:/login";
    }
    @GetMapping("/user/{user}")
    public String userInfo(@RequestParam(name = "title", required = false) String title, @PathVariable("user") User user, Model model){
        model.addAttribute("user", user);
        return "user-info";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam("name") String name, Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        user.setName(name);
        userService.updateUser(user);
        return "redirect:/profile";
    }

}
