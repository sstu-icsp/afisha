package org.epl.model;

import javax.persistence.*;
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
	
	@JoinColumn(name="idGender")
	@ManyToOne
	@NotNull
	private Gender gender;

	@Transient
	private int genderId;

	@JoinColumn(name = "idImages")
	@ManyToOne
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

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public int getGenderId() {
		return gender == null ?  genderId : gender.getId();
	}

	public void setGenderId(int genderId) {
		this.genderId = genderId;
	}
}
