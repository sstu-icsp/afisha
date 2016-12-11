package org.epl.dao;

import org.epl.model.Comment;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDaoImpl extends AbstractDao<Integer, Comment> implements  CommentDao {

    @Override
    public Comment findById(int id) {
        return getByKey(id);
    }

    @Override
    public void saveComment(Comment comment) {
        persist(comment);
    }

    @Override
    public void deleteCommentById(int id) {
        delete(findById(id));
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Comment> findAllComments() {
        Criteria criteria=createEntityCriteria();
        return (List <Comment>) criteria.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentsByUser(int userId) {
        return (List<Comment>)getSession().createQuery("FROM Comment c WHERE c.user.id = " + Integer.toString(userId)).list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Comment> findCommentsByEvent(int eventId) {
        return (List<Comment>)getSession().createQuery("FROM Comment c WHERE c.event.id = " + Integer.toString(eventId)).list();
    }
}
