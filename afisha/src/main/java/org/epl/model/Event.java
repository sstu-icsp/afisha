package org.epl.model;


import javax.persistence.*;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "events")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idEvents")
    private int id;

    @Size(max=45, message = "Неверная длина названия события")
    @NotEmpty(message = "Название события не может быть пустым")
    @Column(name = "title")
    private String title;

    @DateTimeFormat(pattern = "DD-MM-YYYY HH:mm:ss")
    @Column(name = "date")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    private LocalDateTime date;

    @ManyToOne
    @JoinColumn(name = "idCities")
    private City city;

    @Transient
    private int cityId;

    @Column(name = "coords")
    private String coords;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "idImages")
    private Image image;

    @ManyToOne
    @JoinColumn(name = "idTypes")
    private org.epl.model.Type type;

    @Transient
    private int typeId;

    @ManyToOne
    @JoinColumn(name = "idUserCreator")
    private User creator;

    @Transient
    private String creatorName;

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public int getCityId() {
        return city == null ? cityId : city.getId();
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public org.epl.model.Type getType() {
        return type;
    }

    public void setType(org.epl.model.Type type) {
        this.type = type;
    }

    public int getTypeId() {
        return type == null ? typeId : type.getId();
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDateTime getData() {
        return date;
    }

    public void setData(LocalDateTime data) {
        this.date = data;
    }

    public String getCoords() {
        return coords;
    }

    public void setCoords(String coords) {
        this.coords = coords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }
}
