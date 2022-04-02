package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdServletSW
 */
@WebServlet("/ProdServletSW.do")
public class ProdServletSW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdServletSW() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		String lgu = request.getParameter("lgu");

		IProdService service = ProdServiceImpl.getInstance();
		
		// 신발 장난감에 해당하는 list가 없는 경우... 
		List<ProdVO> list = service.selectByLgu(lgu);
		
		
		JsonObject obj = new JsonObject();
		
		if(list !=null && list.size() > 0) {
			//데이터가 있다.
		   obj.addProperty("sw", "ok");
		   Gson gson = new Gson();
		   JsonElement jele = gson.toJsonTree(list);
		   obj.add("datas", jele);
		}else {
			//데이터가 없다. 
			obj.addProperty("sw", "no");
			
		}
		
		
		/*
		 */
		 response.setContentType("application/json; charset=utf-8");
		 PrintWriter out = response.getWriter();
		 out.print(obj);
		 out.flush();
		
		/*
		  request.setAttribute("prodlist", list);
		  request.getRequestDispatcher("0330/prodlist.jsp").forward(request, response);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idvalue = request.getParameter("idvalue");
		IProdService service = ProdServiceImpl.getInstance();
		
		ProdVO vo = service.selectByid(idvalue);
		
		
		Gson gson = new Gson();
		String result = gson.toJson(vo);
		
		response.setContentType("application/json; charset=utf-8");
		 PrintWriter out = response.getWriter();
		 out.print(result);
		 out.flush();
		

	}

}