package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 전송 데이터 받기 
		String id  = request.getParameter("id");
		
		//2. service객체 생성
		IMemberService service = MemberServiceImpl.getInstance();
				
		//3. service메소드 호출 - 결과값 받기 
		String idcheck = service.idCheck(id);
		//결과값은 a001 -> a001 , k123 -> null
		
		//4. request에 저장 
		request.setAttribute("idCheck", idcheck);
		//5. JSP로 forward한다. 
		request.getRequestDispatcher("member/idCheck.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
