package com.example.diploma.services;

import com.example.diploma.models.DownloadStats;
import com.example.diploma.repositories.DownloadStatsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class DownloadStatsService {
    private final DownloadStatsRepository downloadStatsRepository;

    public void recordDownload(HttpServletRequest request) {
        DownloadStats stats = new DownloadStats();
        stats.setDownloadTime(LocalDateTime.now());
        stats.setUserAgent(request.getHeader("User-Agent"));
        
        downloadStatsRepository.save(stats);
        log.info("Download recorded: UserAgent={}", stats.getUserAgent());
    }

    public long getTotalDownloads() {
        return downloadStatsRepository.count();
    }
} 