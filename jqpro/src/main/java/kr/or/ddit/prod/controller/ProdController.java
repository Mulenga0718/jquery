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

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdController
 */
@WebServlet("/ProdController.do")
public class ProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lgu = request.getParameter("lgu");
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> list = service.selectByLgu(lgu);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		
		response.setContentType("application/json; charset=utf-8");
		 PrintWriter out = response.getWriter();
		 out.print(result);
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
		
		/*
		  request.setAttribute("proddetail", vo);
		  request.getRequestDispatcher("0330/proddetail.jsp").forward(request,
		  response);
		 */
	}

}
