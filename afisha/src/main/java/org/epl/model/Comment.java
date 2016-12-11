package org.epl.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="comments")
public class Comment {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @ManyToOne
    @JoinColumn(name="idUser")
    private User user;

    @Transient
    private int userId;

    @ManyToOne
    @JoinColumn(name="idEvent")
    private Event event;

    @Transient
    private int eventId;

    @Column(name="comment")
    @NotEmpty
    @NotNull
    private String comment;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getUserId() {
        return (user != null) ? user.getId() : userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public int getEventId() {
        return (event != null) ? event.getId() : eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
