package org.epl.service;

import org.epl.model.Comment;

import java.util.List;

public interface CommentService {
    Comment findById(int id);
    void saveComment(Comment comment);
    void updateComment(Comment comment);
    void deleteCommentById(int id);
    List<Comment> findAllComments();
    List<Comment> findCommentsByUser(int userId);
    List<Comment> findCommentsByEvent(int eventId);
}
