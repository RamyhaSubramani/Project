package com.servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;

/**
 * Servlet implementation class Readfile
 */
@WebServlet("/Readfile")
public class Readfile extends HttpServlet 
    {
	private static final long serialVersionUID = 1L;
       
    /**
    * @see HttpServlet#HttpServlet()
    */
    public Readfile() {
    super();
        // TODO Auto-generated constructor stub
    }

	/**
	* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filecontent=null;
		
    String filename=request.getParameter("read").replace("E:\\Rajesh workspace\\Deduplication\\WebContent\\Local\\","");
		
    String path="E:\\Rajesh workspace\\Deduplication\\WebContent\\Local\\"+filename;
	
	ArrayList<String> list=new ArrayList<String>();
	
	
	PrintWriter uuu=response.getWriter();
	
	response.setHeader("Content-Disposition","attachment;filename='"+filename+"'");
	
	FileInputStream fis=new FileInputStream("E:\\Rajesh workspace\\Deduplication\\WebContent\\Local\\"+filename);
	int i;
	while((i=fis.read())!=-1)
	{
		uuu.write(i);
	}


		
	try
	{
			PdfReader r=new PdfReader(path);
			int tot=r.getNumberOfPages();
			
			System.out.println("Total"+tot);
			i=1;
			for(i=1;i<=tot;i++)
			{
				list.add(PdfTextExtractor.getTextFromPage(r,i));
			}
			if (filename.endsWith(".txt")) {// if open

				//file encrypted and store into filepath1
							
							FileInputStream fis1 = new FileInputStream(path);
							byte[] b = new byte[fis.available()];
							fis.read(b);
							String reading = new String(b);
						 filecontent = filecontent + reading;
			                System.out.println("filecontent=" + filecontent);
			                try {//try1 open
			                	
			                	String editpath=path.substring(0, path.indexOf("."));
			            		
			            		System.out.println("edithpath1111111111111111======"+editpath);
			            		
			            		 path=editpath+"Deduplication\\WebContent\\Local\\";  
			        			
			        				
			                	
			                 File file1 = new File(path);
			                        file1.createNewFile();
			                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
			                        FileWriter fw = new FileWriter(file1.getAbsoluteFile());
			        				BufferedWriter bw = new BufferedWriter(fw);
			                        bw.write(filecontent);// Write in file
			                        bw.close();// Close connection
			                        System.out.println("fileeeeeeeeeeeeeeeee" + path);
			           
			              //file decrypted and store into filepath2
			                       
			        		   
			                        File file2 = new File(path);
			                        file2.createNewFile();
			                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
			                        FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
			        				BufferedWriter bw1 = new BufferedWriter(fw1);
			                        bw1.write(filecontent);// Write in file
			                        bw1.close();// Close connection
			                        System.out.println("fileeeeeeeeeeeeeeeee" + path);
			           
			                        
			                        }// try close
			                        
			        			
			             
			        			catch (Exception e) {
			        				System.out.println(e);
			        			}
						}
						else if (filename.endsWith(".docx")) 
						{  
							WordExtractor extractor = null;
							
							FileInputStream fis2=new FileInputStream(path);
							System.out.println("file is"+fis2);
							HWPFDocument document=new HWPFDocument(fis2);
							extractor = new WordExtractor(document);
							String [] fileData = extractor.getParagraphText();
							String mydate=extractor.getTextFromPieces();
							System.out.println("DATASSSSSSSSSSSSSSSSSss "+fileData);
							System.out.println("THE MYYYYYYYYYYY "+mydate);
							String text1=null;
							System.out.println("filedata len  "+fileData.length);
						}
		    }
	catch(IOException e)
			{
				e.printStackTrace();
			}
		
		    System.out.println(list);
		
		
		    HttpSession rr=request.getSession();
		    rr.setAttribute("list2", list);
		
		
		    response.sendRedirect("viewfile.jsp");
		
	}
	

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
	}
}


