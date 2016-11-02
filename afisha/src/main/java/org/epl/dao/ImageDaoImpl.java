package org.epl.dao;

import java.util.List;

import org.epl.model.Event;
import org.epl.model.Image;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
@Repository
public class ImageDaoImpl extends AbstractDao<Integer, Image> implements ImageDao {

	public Image findById(int id) {
		 return getByKey(id);
	}

	public void saveImage(Image image) {
		persist(image);

	}

	public void deleteImageById(int id) {
		delete(findById(id));
	}

	public List<Image> findAllImages() {
		Criteria criteria=createEntityCriteria();
		return (List <Image>) criteria.list();
	}
	

}
