package org.Servlet;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;


@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024*1024*2, //2 MB
				maxFileSize = 1024*1024*20, //20 MB
				maxRequestSize = 1024*1024*50 //50 MB
				)
public class UploadServlet extends HttpServlet {
	private static final String SAVE_DIR = "Pics";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String filePath = new String("C:\\\\Users\\\\LENOVO\\\\eclipse-workspace\\\\FurnitureStoreProject\\\\WebContent\\\\" + SAVE_DIR);
		
		String usertype = new String(request.getParameter("usertype"));
		String productid = new String(request.getParameter("product_id"));
		String products = new String(request.getParameter("product"));
		String basematerial = new String(request.getParameter("base"));
		String colors = new String(request.getParameter("color"));
		String money = new String(request.getParameter("price"));
		String big = new String(request.getParameter("size"));
		String maker = new String(request.getParameter("producer"));
		String stat = new String(request.getParameter("comments"));
		
		Part part = request.getPart("image");
		String fileName = extractFileName(part);
		System.out.println(fileName);
		String path = filePath + "\\\\" + fileName;
		File save = new File(path);
		
		part.write(path);
		
		try {
			
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "furnituredb";
			String dbuser = "root";
			String dbpw = "";
										
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(connectionUrl+dbName, dbuser, dbpw);
			Statement ps = con.createStatement();
			System.out.println("Connected");
			
			String addpro = "INSERT INTO FURNITURE_PRODUCTS(PRODUCT_ID, PRODUCT_NAME, MATERIAL, COLOR, SIZE, PRODUCER, PRICE, IMAGE, COMMENTS, CLICKED) VALUES('"+productid+"','"+products+"','"+basematerial+"','"+colors+"','"+big+"','"+maker+"','"+money+"', '"+fileName+"', '"+stat+"', '0')";
			
			int add = ps.executeUpdate(addpro);
			
			if(add > 0) {
				
				System.out.println("Successfully added");
				
			}
			
			ps.close();
			con.close();
			
			if(usertype.equals("administrator")){
				
				response.sendRedirect("Admin/adminproduct.jsp");
				
			}
			else if(usertype.equals("customer")){
				
				response.sendRedirect("User/userhomepage.jsp");
				
			}
			else if(usertype.equals("seller")) {
				
				response.sendRedirect("Vendor/sellerhomepage.jsp");
				
			} else {
				
				response.sendRedirect("Database/login.jsp");
				
			}
			
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		
	}

	private String extractFileName(Part part) {
		String contentDisplay = part.getHeader("content-disposition");
		System.out.println(contentDisplay);
		String[] items = contentDisplay.split(";");
		for (String x : items) {
			
			if(x.trim().startsWith("filename")) {
				
				String path = x.substring(x.indexOf("=") + 2, x.length() - 1);
				String[] directory = path.split("\\\\");
				
				for(String y : directory) {
					
					if(y.trim().endsWith(".jpg") || y.trim().endsWith(".jpeg") || y.trim().endsWith(".png")) {
						
						return y;
						
					}
					
				}
				
			}
			
		}
		
		return "";
	}

}
