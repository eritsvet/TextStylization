package com.example.diploma.services;

import com.example.diploma.models.Comment;
import com.example.diploma.models.User;
import com.example.diploma.repositories.CommentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;

    public Page<Comment> listComments(Pageable pageable) {
        log.info("Fetching comments with page size: {}", pageable.getPageSize());
        return commentRepository.findAllByOrderByDateOfCreatedDesc(pageable);
    }

    @Transactional
    public void saveComment(User user, String text) {
        try {
            Comment comment = new Comment();
            comment.setText(text);
            comment.setUser(user);
            Comment savedComment = commentRepository.save(comment);
            log.info("Comment saved successfully with id: {}", savedComment.getId());
        } catch (Exception e) {
            log.error("Error saving comment: {}", e.getMessage());
            throw new RuntimeException("Failed to save comment", e);
        }
    }

    @Transactional
    public void deleteComment(Long id, User user) {
        try {
            Comment comment = commentRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Comment not found"));
            
            if (user.isAdmin() || comment.getUser().equals(user)) {
                commentRepository.delete(comment);
                log.info("Comment with id {} was deleted by user {}", id, user.getEmail());
            } else {
                throw new RuntimeException("You don't have permission to delete this comment");
            }
        } catch (Exception e) {
            log.error("Error deleting comment: {}", e.getMessage());
            throw new RuntimeException("Failed to delete comment", e);
        }
    }
} 