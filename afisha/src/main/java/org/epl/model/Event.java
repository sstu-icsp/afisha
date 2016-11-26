package org.epl.model;

import java.awt.Point;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="events")
public class Event {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idEvents")
	private int id;

	@JoinColumn(name = "idTypes")
    @ManyToOne
	private TypeOfEvents type;

	@NotEmpty(message = "Название события не может быть пустым")
    @Size(min=0, max=45, message = "Неверная длина названия события")
	@Column(name="title")
	private String title;

	@DateTimeFormat(pattern="dd/MM/yyyy")
    @Column(name = "date", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull
	private LocalDate data;

	@ManyToOne
	@JoinColumn(name="idCities")
	private City city;

	@Column(name="coords")
	private Point coords;

	@Column(name="description")
	private String description;

	@ManyToOne
	@JoinColumn(name="idImages")
	private Image image;



    public void setType(TypeOfEvents type) {
        this.type = type;
    }

    public TypeOfEvents getType() {
        return type;
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

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public Point getCoords() {
		return coords;
	}

	public void setCoords(Point coords) {
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
