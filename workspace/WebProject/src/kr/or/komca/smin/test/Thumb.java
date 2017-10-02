package kr.or.komca.smin.test;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/Thumb")
public class Thumb extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String root = request.getSession().getServletContext().getRealPath("/");
		
		String savePath = "upload";
		String uploadFilePath = getServletContext().getRealPath(savePath);
		
		int uploadFileSizeLimit = 30 * 1024 * 1024 ;
		String encType = "UTF-8" ;
		
		MultipartRequest multi = new MultipartRequest(
				request, uploadFilePath,
				uploadFileSizeLimit,
				encType,
				new DefaultFileRenamePolicy()
				);
		
		String serverFileName = multi.getFilesystemName("upfile");
		String originalFileName = multi.getOriginalFileName("upfile");
		
		
			
		//String savePath = "upload";
		String pathDelimeter = "\\";
		//String orgFileName = "BLACK.png";
		//String uploadFilePath = getServletContext().getRealPath(savePath);
		
		File srcImgFile = new File(root + "upload/" + originalFileName);
		
		int width = 100;
		int height = 70;
		
		try{
			
			BufferedImage srcImg = ImageIO.read(srcImgFile);
			BufferedImage thumImg ;
			
			thumImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
			
			java.awt.Graphics2D g = thumImg.createGraphics();
			
			g.drawImage(srcImg, 0, 0, width, height, null);
			
			File outFile = new File(root + savePath + "/thumb_"+ originalFileName);
			
			ImageIO.write(thumImg, "PNG", outFile);
			
		}catch(Exception e){
			e.getStackTrace();
		}
		
		
		request.setAttribute("uploadFilePath", uploadFilePath);	
		request.setAttribute("serverFileName", serverFileName);		
		request.setAttribute("originalFileName", originalFileName);		
	
		
		RequestDispatcher rd = request.getRequestDispatcher("uploadCheck.jsp");
		rd.forward(request, response);
		
		
	}

}
