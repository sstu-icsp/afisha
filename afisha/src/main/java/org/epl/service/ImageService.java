package org.epl.service;

import java.util.List;

import org.epl.model.Image;

public interface ImageService {
	Image findById(int id);
	void saveImage(Image image);
	void updateImage(Image image);
	void deleteImageById(int id);
	List <Image> findAllImage();
}
