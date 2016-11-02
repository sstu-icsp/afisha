package org.epl.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.epl.dao.ImageDao;
import org.epl.model.Image;
import org.epl.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

@WebServlet("/images")
public class ImageServlet extends HttpServlet {

	@Autowired
	private ImageService service;
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Image image=service.findById(1);
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
