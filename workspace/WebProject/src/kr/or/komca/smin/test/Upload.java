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


@WebServlet("/Upload")
public class Upload extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

	
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
		
		
		/* 이미지 사이즈 */
		File file;
		BufferedImage bi;
		
		int width = 740;
		int height = 0;
		
		try{
			file = new File(uploadFilePath + "/" + serverFileName);
			bi = ImageIO.read(file);
			//x = bi.getWidth();
			height = (int)(bi.getHeight() * width / bi.getWidth());
			//y = bi.getHeight();
			
		}catch(Exception e){
			e.getStackTrace();
		}
		
		request.setAttribute("width", width);		
		request.setAttribute("height", height);		
		request.setAttribute("uploadFilePath", uploadFilePath);		
		request.setAttribute("serverFileName", serverFileName);
		request.setAttribute("originalFileName", originalFileName);
		
		RequestDispatcher rd = request.getRequestDispatcher("uploadCheck.jsp");
		rd.forward(request, response);
		
		
	}

}
