package cn.edu.nwsuaf.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 分页控制 ；控制页码的；用来传当前页码
 * @author 张琼
 * 2017-6-22
 */
@Controller
public class SearchPageAction {
	@RequestMapping("/pageSearch.action")
	public void searchPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		int pageNos;
		if (request.getParameter("pageNos") == null
				|| Integer.parseInt(request.getParameter("pageNos")) < 1) {
			pageNos = 1;
		} else {
			pageNos = Integer.parseInt(request.getParameter("pageNos"));
		}
		session.setAttribute("pageNos", pageNos);
		
		
		// 定义总页数并存到session中
		//int countPage = 3;
		// 在实际开发中我们的总页数可以根据sql语句得到查询到的总条数，然后用总条数除每页的条数得到总页数
		//session.setAttribute("countPage", countPage);
		request.getRequestDispatcher("GoodsSearch.jsp").forward(request, response);
	}

}
