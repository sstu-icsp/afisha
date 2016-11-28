package org.epl.dao;

import java.util.List;

import org.epl.model.Image;

public interface ImageDao {
	Image findById(int id);
	void saveImage(Image image);
	void deleteImageById(int id);
	List <Image>findAllImages();
}
