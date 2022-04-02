package kr.or.ddit.zip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.zip.service.IZipService;
import kr.or.ddit.zip.service.ZipServiceImpl;

/**
 * Servlet implementation class ZipTableServlet
 */
@WebServlet("/ZipTableServlet.do")
public class ZipTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gubun = request.getParameter("gubun");
		IZipService service = ZipServiceImpl.getInstance();
		List<String> list = null;
		if(gubun.equals("1")) {
			list = service.selectSido();
		}
		
		if(gubun.equals("2")) { 
		 String sido = request.getParameter("sido");
		 System.out.println(sido);
		 list = service.selectGugun(sido); 
		 }
		if(gubun.equals("3")) { 
			 String sido = request.getParameter("sido");
			 String gugun = request.getParameter("gugun");
			 Map<String,String> map = new HashMap<String, String>();
			 map.put("sido", sido);
			 map.put("gugun", gugun);
			 
			 list = service.selectDong(map); 
			 }
		if(gubun.equals("4")) { 
			 String sido = request.getParameter("sido");
			 String gugun = request.getParameter("gugun");
			 String dong = request.getParameter("dong");
			 Map<String,String> map = new HashMap<String, String>();
			 map.put("sido", sido);
			 map.put("gugun", gugun);
			 map.put("dong", dong);
			 list = service.selectzip(map); 
		
			 }
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
	
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
