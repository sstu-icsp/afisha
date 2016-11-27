package org.epl.model;

import javax.persistence.*;

@Entity
@Table(name = "gender")
public class Gender {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="genderId")
    private int id;

    @Column (name="name")
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
