package com.example.diploma.repositories;

import com.example.diploma.models.DownloadStats;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DownloadStatsRepository extends JpaRepository<DownloadStats, Long> {
    long count();
} 