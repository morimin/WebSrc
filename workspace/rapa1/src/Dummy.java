

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dummy
 */
@WebServlet("/Dummy")
public class Dummy extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		File file;  // 프로그램 실행의 목적이아니라 import 값을 보기위함.
		BufferedImage bi;
		ImageIO io;
		
		try {
			
		} catch (Exception e) {
			
		}
		
		
		
	}//doPost

}
