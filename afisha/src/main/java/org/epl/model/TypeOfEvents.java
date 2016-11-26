package org.epl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="typesofevents")

public class TypeOfEvents {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idTypes")
	private int id;
	
	@Column (name="title")
	private String title;

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

	
	
	
	

}
