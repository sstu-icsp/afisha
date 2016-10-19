package org.epl.model;

import org.joda.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="events")
public class Event {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idEvents")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="idTypes")
	private Type type;

	@Transient
	private int typeId;
	
	@Column(name="title")
	private String title;

	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name = "date", nullable = false)
	@org.hibernate.annotations.Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
	@NotNull
	private LocalDateTime date;

	@ManyToOne
	@JoinColumn(name="idCities")
	private City city;

	@Transient
	private int cityId;
	
	@Column(name="coords")
	private String coords;
	
	@Column(name="description")
	private String description;
	
	@ManyToOne
	@JoinColumn(name="idImages")
	private Image image;

	@Transient
	private int imageId;
	
	@ManyToOne
	@JoinColumn(name="idUserCreator")
	private User user;

	@Transient
	private int userId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getTypeId() {
		return (type != null) ? type.getId() : typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getImageId() {
		return (image != null) ? image.getId() : imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public int getUserId() {
		return (user != null) ? user.getId() : userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public int getCityId() {
		return (city != null) ? city.getId() : cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
}
