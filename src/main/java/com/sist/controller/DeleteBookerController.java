package com.sist.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.dao.SalonSistDao;


/**
 * Servlet implementation class DeleteCustomerController
 */
@WebServlet("/deleteBooking.do")
public class DeleteBookerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int booker_num = Integer.parseInt(request.getParameter("booker_num"));
		SalonSistDao dao = SalonSistDao.getInstance();
		int re = dao.deleteBooking(booker_num);
		String msg = "예약을 삭제하였습니다.";
		if(re != 1) {
			msg = "예약 삭제에 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		RequestDispatcher dispatcher = request.getRequestDispatcher("deleteBookingOK.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
