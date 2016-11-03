package org.epl.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.epl.dao.ImageDao;
import org.epl.model.Image;
import org.epl.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {
	@Autowired
	private ImageService service;
	@RequestMapping("/im")
	public String index(ModelMap model)
	{
		model.addAttribute("image", service.findById(1).getId());
		return "image";
	}
	
	@RequestMapping("/image")
	public void image(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		Image image=service.findById(Integer.parseInt(req.getParameter("id")));
		System.out.println(image);
		resp.setContentType("image");
	
		byte[] bytes=image.getImage();
		resp.setContentLength(bytes.length);
		BufferedOutputStream output = null;
		try {
		   
		    output = new BufferedOutputStream(resp.getOutputStream());
		  
		    output.write(bytes);
		    
		} finally {
		    if (output != null) try { output.close(); } catch (IOException logOrIgnore) {}
		}
	}
		
	
	
	
	

}