package org.epl.model;

import javax.persistence.*;

@Entity
@Table(name="images")
public class Image {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idImages")
	private int id;

	@Column(name="img")
	@Lob
	private byte[] data;

	public Image() {
	}

	public Image(byte[] data) {
		this.data = data;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] image) {
		this.data = image;
	}
}
