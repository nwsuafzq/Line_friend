/**
 * author 刘志伟
 * 2017-7-4
 */
package cn.edu.nwsuaf.controller.pay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 刘志伟
 * 
 *  2017-7-4
 */
@Controller
public class PayAction {
	@RequestMapping("/toPay.action")
	public void pay(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String action = request.getRequestURI();
		action = action.substring(action.lastIndexOf('/'), action
				.lastIndexOf('.'));
		System.out.println("action--------" + action);
		if ("/toPay".equals(action)) {// 1.访问选择支付银行的页面(payWay.jsp)
			//String orderId = "201608080000075";// 后期自动生成订单编号//"201608080000002"
			String orderId = request.getParameter("orderId");
		
			String price = request.getParameter("price");
			String receive_name = request.getParameter("receive_name");
			receive_name = new String(receive_name.getBytes("gbk"), "UTF-8");  
			String address = request.getParameter("address");
			address = new String(address.getBytes("iso-8859-1"), "UTF-8");  
			String phone = request.getParameter("phone");
			System.out.println(orderId+price+receive_name+address+phone);
			double totalPrice = Double.parseDouble(price);
			//double totalPrice = 0.01;// 后期用代码计算出订单总价
			//String address = "陕西咸阳杨凌";// 后期改成从数据库获取收货地址
			String username = receive_name;
			request.setAttribute("orderId", orderId);
			request.setAttribute("address", address);
			request.setAttribute("username", username);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("phone", phone);
			request.getRequestDispatcher("/payWay.jsp").forward(request,
					response);
		}
	}

	@RequestMapping("/toSure.action")
	public void toSure(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ordernum = request.getParameter("orderId");// sure.jsp转入易宝支付进行支付
		String money = request.getParameter("totalPrice");
		String pd_FrpId = request.getParameter("pd_FrpId");// 银行编码(payWay.jsp提交的)
		String p0_Cmd = "Buy";// 业务类型(买东西)
		String p1_MerId = "10001126856";// 商户编号
		String p2_Order = ordernum;// 订单号
		String p3_Amt = money;// 订单金额
		String p4_Cur = "CNY";// 交易币种(ChiNa Yuan)
		String p5_Pid = "books"; // 商品名称(后期换成真是的商品名称<例如"JavaEE实践">)
		String p6_Pcat = "unknown";// 商品种类(后期换成真是的商品种类<小说，散文等>)
		String p7_Pdesc = "descrition";// 订单描述(后期换成真是的订单描述信息)
		// p8_Url:处理支付完成的地址
		String p8_Url = "http://localhost:8080" + request.getContextPath()
				+ "/responsePay.action";
		String p9_SAF = "1";// 送货地址(后期换成选择的收货地址)
		String pa_MP = "unknown";// 商户扩展信息
		String pr_NeedResponse = "1"; // 应答机制
		String pr_key = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";// 商户密钥
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, pr_key);

		request.setAttribute("p0_Cmd", p0_Cmd);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("p2_Order", p2_Order);
		request.setAttribute("p3_Amt", p3_Amt);
		request.setAttribute("p4_Cur", p4_Cur);
		request.setAttribute("p5_Pid", p5_Pid);
		request.setAttribute("p6_Pcat", p6_Pcat);
		request.setAttribute("p7_Pdesc", p7_Pdesc);
		request.setAttribute("p8_Url", p8_Url);
		request.setAttribute("pa_MP", pa_MP);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("hmac", hmac);
		request.setAttribute("p9_SAF", p9_SAF);
		request.setAttribute("pd_FrpId", pd_FrpId);

		request.getRequestDispatcher("/sure.jsp").forward(request, response);
	}

	@RequestMapping("/responsePay.action")
	public void responsePay(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");// 支付结果。1代表成功
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");// 订单编号
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");// 1浏览器访问的。2点对点
		String hmac = request.getParameter("hmac");

		// 数据校验
		boolean ok = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
				r8_MP, r9_BType,
				"69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");
		if (!ok) {
			out.write("数据有可能被篡改，请联系网站");
		} else {
			if ("1".equals(r1_Code)) {
				// 支付成功：根据订单号更改订单状态。 点卡或充值时注意表单的重复提交问题。
				out.write("支付成功");
			}
		}
	}
}
