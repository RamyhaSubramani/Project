


package com.servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;



import com.bean.Filebean;
import com.bean.Regbean;
import com.imple.Regimple;
import com.inter.Reginter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;



/**
 * Servlet implementation class Fileupload
 */
@WebServlet("/Fileupload")
public class Fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String Ownername = null;
	
	private String date;
	private char[] size;
       
    /**       
     * @see HttpServlet#HttpServlet()
     */
    public Fileupload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Part part = null;
		FilePart filePart = null;
		ParamPart paramPart = null;
		String type = null;
		double fileSize=0.0;
		String filename =null;
		String filetype=null;
		String filename1=null;
		//String items=null;
		String filecontent="";
		String fullfilecontent="";
		String line = "";
		String encryptcontent = null;
		String filepath2=null;
		String filebyte=null;
		String password=null;
		 HttpSession session2=request.getSession();
		 String email=session2.getAttribute("email").toString();
		String Key= (String) session2.getAttribute("key");
		System.out.println(Key);
        PrintWriter out=response.getWriter();
        

	
MultipartParser mp =new MultipartParser(request, 999999999);
		
		
		ArrayList paramValues = new ArrayList();
		
		FilePart filepart = null;
		ParamPart param=null;
		File file1 = null;
		String filepath1 = null;
		
		String encontent = null;
		
		String path=getServletContext().getRealPath("");
		
		System.out.println("path0000000000000000000000=="+path);
		
		
		String editpath=path.substring(0, path.indexOf("."));
		
		System.out.println("edithpath1111111111111111======"+editpath);
		
		String fullpath=editpath+"Deduplication\\WebContent\\Local\\";
		
		
		System.out.println("fullpath333333333333333=="+fullpath);
		
		while((part=mp.readNextPart())!=null)
		{
			
			if(part.isFile())
			{
				
				filepart=(FilePart)part;
				
				
			 filename=filepart.getFileName();
				
				System.out.println("filename9999999999999999=="+filename);
				
			 fullpath=fullpath+filename;
				
				System.out.println("fullpath5555555555555555555=="+fullpath);
				
				
				
				File file=new File(fullpath);
				long size=filepart.writeTo(file);
				
				System.out.println("size6666666666666=="+size);
				
			 filetype=filepart.getContentType();
				System.out.println("filetype88888888888---"+filetype);
				
			}
			else if(part.isParam())
			{
				param = (ParamPart) part;
				String tagName =param.getName();
				System.out.println("tagName ============= " + tagName);
				String tagValue = param.getStringValue();
				System.out.println("tagValue ************ " + tagValue);
				paramValues.add(tagValue);
				paramValues.add(tagName);
				
			}
		
	
			// FileInputStrean get bytes from file

		}

			if (filename.endsWith(".txt")) {// if open

	//file encrypted and store into filepath1
				
				FileInputStream fis = new FileInputStream(fullpath);
				byte[] b = new byte[fis.available()];
				fis.read(b);
				String reading = new String(b);
				filecontent = filecontent + reading;
                System.out.println("filecontent=" + filecontent);
                try {//try1 open
                	
                    
        			encontent = AES.encrypt99(filecontent);
        				System.out.println("encontent===="+encontent);
             filepath1 = editpath + "\\Deduplication\\WebContent\\Encryptdata\\"+ filename;
                  file1 = new File(filepath1);
                        file1.createNewFile();
                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
                        FileWriter fw = new FileWriter(file1.getAbsoluteFile());
        				BufferedWriter bw = new BufferedWriter(fw);
                        bw.write(encontent);// Write in file
                        bw.close();// Close connection
                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath1);
           
              //file decrypted and store into filepath2
                        String      decontent= AES.decrypt(encontent);
        				System.out.println("decontent===="+decontent);
        		    filepath2 = editpath + "\\Deduplication\\WebContent\\decrypt\\"+ filename;
                        File file2 = new File(filepath2);
                        file2.createNewFile();
                        if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
                        FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
        				BufferedWriter bw1 = new BufferedWriter(fw1);
                        bw1.write(decontent);// Write in file
                        bw1.close();// Close connection
                        System.out.println("fileeeeeeeeeeeeeeeee" + filepath2);
           
                        
                        }// try close
                        
        			
             
        			catch (Exception e) {
        				System.out.println(e);
        			}
			}
			else if (filename.endsWith(".docx")) 
			{  
				WordExtractor extractor = null;
				
				FileInputStream fis2=new FileInputStream(fullpath);
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
			
			else if(filename.endsWith(".pdf"))
			{ 
				//System.out.println("padf file name"+file1.getName());
			
				String text="";
			PdfReader pdfReader=new PdfReader(fullpath);
				String	Text7 = null;
				int pages=pdfReader.getNumberOfPages();
				for(int i1=1;i1<pages;i1++)
				{
					 text=PdfTextExtractor.getTextFromPage(pdfReader, i1);
					System.out.println("page:"+i1+" "+text);
					Text7=Text7+text;
					
				}
				System.out.println("Pdf full content ="+Text7);
			String encrpt;
			try {
				encrpt = encryptdata.encrypt(text);
			Document document=new Document(PageSize.A4);
			/*  File file=new File("C:\\Users\\spiro13\\Desktop\\naga\\"+pdffilename);
			  System.out.println(file.delete());*/
			PdfWriter.getInstance(document, new FileOutputStream(new File(filepath2+filename)));
			//FileOutputStream fileOutputStream=new FileOutputStream("C:\\Users\\spiro13\\Desktop\\naga\\pdffilename1.pdf");
			Chunk chunk=new Chunk(encrpt);
			document.open();
			Font font=new Font();
			font.setStyle(Font.BOLD);
			Paragraph p1=new Paragraph(chunk);
			p1.setAlignment(Element.ALIGN_LEFT);
			document.add(p1);
			document.close();
			System.out.println("pdf writing is completed");
			//fileOutputStream.write(encrpt.getBytes());
			System.out.println(encrpt);
			} catch(Exception e)
			{
				e.printStackTrace();
			}
               
			try {//try1 open
                	
                
				encontent = AES.encrypt99(filecontent);
				System.out.println("encontent===="+encontent);
     filepath1 = editpath + "\\Deduplication\\WebContent\\Encryptdata\\"+ filename;
          file1 = new File(filepath1);
                file1.createNewFile();
                if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
                FileWriter fw = new FileWriter(file1.getAbsoluteFile());
				BufferedWriter bw = new BufferedWriter(fw);
                bw.write(encontent);// Write in file
                bw.close();// Close connection
                System.out.println("fileeeeeeeeeeeeeeeee" + filepath1);
   
      //file decrypted and store into filepath2
                    String  decontent= AES.decrypt(encontent);
				System.out.println("decontent===="+decontent);
		    filepath2 = editpath + "\\Deduplication\\WebContent\\decrypt\\"+ filename;
                File file2 = new File(filepath2);
                file2.createNewFile();
                if (!file1.exists()) {file1.createNewFile();}// If file doesn't exists, then create it
                FileWriter fw1 = new FileWriter(file2.getAbsoluteFile());
				BufferedWriter bw1 = new BufferedWriter(fw1);
                bw1.write(decontent);// Write in file
                bw1.close();// Close connection
                System.out.println("fileeeeeeeeeeeeeeeee" + filepath2);
   
                
                }// try close
                
			
     
			catch (Exception e) {
				System.out.println(e);
			}
			
			
			
			}
		
        
		String Username=request.getParameter("Username");
			
			HttpSession session=request.getSession();
			String name=(String)session.getAttribute("filename");
			
			String getemail=session.getAttribute("email").toString();
//			String getpassword=session.getAttribute("password").toString();



			session.setAttribute("email",getemail);
//			session.setAttribute("password",getpassword);
			session.setAttribute("filename", filename);
			session.setAttribute("filekey",Key);

			System.out.println("jshfjshnsuiofhskfdsufdhshfushfhfufhssssssssssssssssssssssssssssssssssssssssssssssssssssssss"+email);
			
			
			Filebean fb=new Filebean();
			fb.setFilename(filename);
			fb.setFilecontent(filecontent);
			
		
			fb.setEncryptcontent(encontent);
			fb.setFilepath(path);
			fb.setDate(date);
			
			fb.setFiletype(filetype);
			fb.setFilekey(Key);
			fb.setEmail(email);
		
			
			int res=0;
			
			Reginter asd=new Regimple();
			res=asd.Fileinsert(fb);
			if(res==1)
			{
				RequestDispatcher req=request.getRequestDispatcher("UploadSucess.jsp");
				req.forward(request, response);
				return;
				//response.sendRedirect("UploadProcess.jsp");
			}
			
			else
			{
				response.sendRedirect("Deduplicate.jsp");
			}
		
}

	}

	


