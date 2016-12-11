package org.epl.dao;

import org.epl.model.Comment;

import java.util.List;

public interface CommentDao {
    Comment findById(int id);
    void saveComment(Comment comment);
    void deleteCommentById(int id);
    List<Comment> findAllComments();
    List<Comment> findCommentsByUser(int userId);
    List<Comment> findCommentsByEvent(int eventId);
}
