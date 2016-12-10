package org.epl.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idUsers")
	private int id;

	@NotEmpty
	@NotNull
	@Column(name="nickname")
	private String nickName;

	@NotEmpty
	@NotNull
	@Column(name="password")
	private String password;
	
	@ManyToOne
	@JoinColumn(name="idRoles")
	private Role role;

	@Column(name="fullname")
	private String fullName;
	
	@DateTimeFormat(pattern="DD-MM-YYYY")
    @Column(name = "birthdate")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate birthDate;

	@ManyToOne
	@JoinColumn(name="idCities")
	private City city;

	@Transient
	private int cityId;
	
	@JoinColumn(name="idGender")
	@ManyToOne
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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

	public int getCityId() {
		return city == null ? cityId : city.getId();
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
}
