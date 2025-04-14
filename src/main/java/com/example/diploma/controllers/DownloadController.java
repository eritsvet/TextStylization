package com.example.diploma.controllers;

import com.example.diploma.services.DownloadStatsService;
import com.example.diploma.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class DownloadController {
    private final UserService userService;
    private final DownloadStatsService downloadStatsService;

    @GetMapping("/download")
    public String downloadPage(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("currentPage", "download");
        return "download";
    }

    @GetMapping("/download/addon")
    public ResponseEntity<Resource> downloadAddon(HttpServletRequest request) throws IOException {
        // Записываем статистику скачивания
        downloadStatsService.recordDownload(request);
        
        // Путь к файлу аддона
        Path filePath = Paths.get("src/main/resources/static/downloads/text_stylization.zip").toAbsolutePath().normalize();
        Resource resource = new UrlResource(filePath.toUri());
        
        if (resource.exists()) {
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"text_stylization.zip\"")
                    .body(resource);
        } else {
            throw new IOException("Addon file not found");
        }
    }
} 