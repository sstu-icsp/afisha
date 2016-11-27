package org.epl.service;

import java.util.List;

import org.epl.dao.ImageDao;
import org.epl.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {
	@Autowired
	private ImageDao dao;

	public Image findById(int id) {
		return dao.findById(id);
	}

	public void saveImage(Image image) {
		dao.saveImage(image);
	}

	public void updateImage(Image image) {
		Image entity=dao.findById(image.getId());
		entity.setData(image.getData());
	}

	public void deleteImageById(int id) {
		dao.deleteImageById(id);
	}

	public List<Image> findAllImage() {
		return dao.findAllImages();
	}
}
