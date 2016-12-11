package org.epl.service;

import org.epl.dao.CommentDao;
import org.epl.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao dao;

    @Override
    public Comment findById(int id) {
        return dao.findById(id);
    }

    @Override
    public void saveComment(Comment comment) {
        dao.saveComment(comment);
    }

    @Override
    public void updateComment(Comment comment) {
        Comment entity = dao.findById(comment.getId());
        entity.setUser(comment.getUser());
        entity.setEvent(comment.getEvent());
        entity.setComment(comment.getComment());
    }

    @Override
    public void deleteCommentById(int id) {
        dao.deleteCommentById(id);
    }

    @Override
    public List<Comment> findAllComments() {
        return dao.findAllComments();
    }

    @Override
    public List<Comment> findCommentsByUser(int userId) {
        return dao.findCommentsByUser(userId);
    }

    @Override
    public List<Comment> findCommentsByEvent(int eventId) {
        return dao.findCommentsByEvent(eventId);
    }
}
