package org.epl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

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
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
    @Column(name = "birthdate", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull
	private LocalDate birthDate;
	
	
	@ManyToOne
	@JoinColumn(name="idCities")
	private City city;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
    @Column(name = "timeFrom", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull
	private LocalDate timeFrom;
	
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
    @Column(name = "timeTo", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    @NotNull
	private LocalDate timeTo;
	
	@Column(name="gender")
	private int gender;
	
	@ManyToOne
	@JoinColumn(name="idImages")
	private Image image;

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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public LocalDate getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(LocalDate timeFrom) {
		this.timeFrom = timeFrom;
	}

	public LocalDate getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(LocalDate timeTo) {
		this.timeTo = timeTo;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	
	
	
	

}
