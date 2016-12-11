package org.epl.model;

import javax.persistence.*;

@Entity
@Table(name="ratings")
public class Rating {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @JoinColumn(name="idUser")
    @ManyToOne
    private User user;

    @Transient
    private int userId;

    @JoinColumn(name="idEvent")
    @ManyToOne
    private Event event;

    @Transient
    private int eventId;

    @Column(name="rating")
    private int rating;

    public int getUserId() {
        return user != null ? user.getId() : userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getEventId() {
        return event != null ? event.getId() : eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

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

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }
}
