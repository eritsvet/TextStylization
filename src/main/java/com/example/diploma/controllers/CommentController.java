package com.example.diploma.controllers;

import com.example.diploma.models.Comment;
import com.example.diploma.models.User;
import com.example.diploma.repositories.CommentRepository;
import com.example.diploma.services.UserService;
import com.example.diploma.services.CommentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.format.DateTimeFormatter;
import java.security.Principal;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CommentController {
    private final CommentService commentService;
    private final UserService userService;
    private final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");

    @GetMapping("/")
    public String home(@AuthenticationPrincipal User user,
                      @PageableDefault(size = 5, sort = {"dateOfCreated"}, direction = Sort.Direction.DESC) Pageable pageable,
                      Model model) {
        try {
            Page<Comment> comments = commentService.listComments(pageable);
            model.addAttribute("comments", comments);
            model.addAttribute("user", user != null ? user : new User());
            model.addAttribute("currentPage", "home");
            model.addAttribute("dateFormatter", dateFormatter);
            
            return "index";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading comments: " + e.getMessage());
            model.addAttribute("currentPage", "home");
            model.addAttribute("user", null);
            return "index";
        }
    }

    @PostMapping("/comment/create")
    public String createComment(@RequestParam("text") String text,
                              @AuthenticationPrincipal User user,
                              RedirectAttributes redirectAttributes) {
        try {
            if (text == null || text.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Comment text cannot be empty");
                return "redirect:/";
            }
            
            if (user == null) {
                redirectAttributes.addFlashAttribute("error", "You must be logged in to post comments");
                return "redirect:/login";
            }
            
            commentService.saveComment(user, text);
            log.info("Comment created by user {}", user.getEmail());
            redirectAttributes.addFlashAttribute("success", "Comment added successfully");
        } catch (Exception e) {
            log.error("Error creating comment: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", "Error creating comment: " + e.getMessage());
        }
        return "redirect:/";
    }

    @PostMapping("/delete/{id}")
    public String deleteComment(@PathVariable Long id, Principal principal) {
        try {
            User user = userService.getUserByPrincipal(principal);
            commentService.deleteComment(id, user);
            return "redirect:/";
        } catch (Exception e) {
            log.error("Error deleting comment: {}", e.getMessage());
            return "redirect:/";
        }
    }
} 