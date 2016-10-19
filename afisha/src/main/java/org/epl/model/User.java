package org.epl.model;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idUsers")
	private int id;
	
	@NotNull
	@Column(name="email")
	private String email;
	
	@NotNull
	@Column(name="nickname")
	private String nickname;
	
	@NotNull
	@Column(name="password")
	private String password;

	@ManyToOne
	@JoinColumn(name="idRoles")
	private Role role;

	@Transient
	private int roleId;

	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name = "birthdate")
	@org.hibernate.annotations.Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate birthdate;

	@ManyToOne
	@JoinColumn(name="idCities")
	private City city;

	@Transient
	private int cityId;

	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name="timeFrom")
	@org.hibernate.annotations.Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
	private LocalDateTime timeFrom;

	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name="timeTo")
	@org.hibernate.annotations.Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
	private LocalDateTime timeTo;

	@ManyToOne
	@JoinColumn(name="idGender")
	private Gender gender;

	@Transient
	private int genderId;

	@ManyToOne
	@JoinColumn(name="idImages")
	private Image image;

	@Transient
	private int imageId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDate birthdate) {
		this.birthdate = birthdate;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getRoleId() {
		return (role != null) ? role.getId() : roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getCityId() {
		return (city != null) ? city.getId() : cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public LocalDateTime getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(LocalDateTime timeFrom) {
		this.timeFrom = timeFrom;
	}

	public LocalDateTime getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(LocalDateTime timeTo) {
		this.timeTo = timeTo;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public int getGenderId() {
		return (gender != null) ? gender.getId() : genderId;
	}

	public void setGenderId(int genderId) {
		this.genderId = genderId;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
}
