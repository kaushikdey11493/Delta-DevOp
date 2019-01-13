package com.delta.admincontrollers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delta.admincontrollers.dao.OrderDetailRepo;
import com.delta.admincontrollers.dao.ProductRepo;
import com.delta.admincontrollers.dao.UserInfoRepo;
import com.delta.admincontrollers.models.OrderDetail;
import com.delta.admincontrollers.models.OrderList;
import com.delta.admincontrollers.models.Product;
import com.delta.admincontrollers.models.UserInfo;

@Controller
public class DeliveryManagerControllers
{
	@Autowired
	OrderDetailRepo orderRepo;
	@Autowired
	OrderList orderlist;
	@Autowired
	ProductRepo prorepo;
	@Autowired
	UserInfoRepo userrepo;
	
	
	private void securityCheck(HttpSession session,HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("delta-login-as")==null)
			response.sendRedirect("/administrationLogin");
		else if(!session.getAttribute("delta-login-as").equals("product_delivery_manager"))
		{
			response.sendRedirect("/administrationLogin");
		}
	}
	
	
	@RequestMapping("delivery_manager")
	public ModelAndView delivery_manager(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("delivery_manager");
		return mv; 
	}
	@RequestMapping("/delivery_manager/orderdetail")
	public ModelAndView orderdetail(HttpSession session)
	{
		List<OrderDetail> list=orderRepo.findAll();
		orderlist.setList(list);
		ModelAndView mv=new ModelAndView("orderdetail");
		mv.addObject("orderlist", orderlist);
		mv.addObject("prorepo", prorepo);
		mv.addObject("userrepo", userrepo);
		return mv;
	}
	@RequestMapping("/delivery_manager/orderdetail/view")
	public ModelAndView orderview(@RequestParam("id") String id)
	{
		OrderDetail order=orderRepo.findById(id).orElse(null);
		Product pro=prorepo.findById(order.getPid()).orElse(null);
		UserInfo user=userrepo.findById(order.getUid()).orElse(null);
		ModelAndView mv=new ModelAndView("view");
		mv.addObject("order", order);
		mv.addObject("pro", pro);
		mv.addObject("user", user);
		return mv;
	}
}
