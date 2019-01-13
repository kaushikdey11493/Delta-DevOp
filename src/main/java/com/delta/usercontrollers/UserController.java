package com.delta.usercontrollers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Lookup;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.delta.admincontrollers.dao.CartRepo;
import com.delta.admincontrollers.dao.CategoryRepo;
import com.delta.admincontrollers.dao.ImageRepo;
import com.delta.admincontrollers.dao.IptrackRepo;
import com.delta.admincontrollers.dao.OrderDetailRepo;
import com.delta.admincontrollers.dao.ProductRepo;
import com.delta.admincontrollers.dao.UserInfoRepo;
import com.delta.admincontrollers.models.Cart;
import com.delta.admincontrollers.models.CartList;
import com.delta.admincontrollers.models.Category;
import com.delta.admincontrollers.models.CategoryList;
import com.delta.admincontrollers.models.Image;
import com.delta.admincontrollers.models.ImageList;
import com.delta.admincontrollers.models.Iptrack;
import com.delta.admincontrollers.models.LoginDetails;
import com.delta.admincontrollers.models.OrderDetail;
import com.delta.admincontrollers.models.OrderList;
import com.delta.admincontrollers.models.Product;
import com.delta.admincontrollers.models.ProductList;
import com.delta.admincontrollers.models.UserInfo;
import com.delta.encpass.Password;

@Controller
public class UserController
{
	@Autowired
	CategoryRepo catrepo;
	@Autowired
	CategoryList catlist;
	@Autowired
	ProductRepo prorepo;
	@Autowired
	ProductList prolist;
	@Autowired
	ImageRepo imgrepo;
	@Autowired
	ImageList imglist;
	@Autowired
	UserInfoRepo userinforepo;
	@Autowired
	CartRepo cartrepo;
	@Autowired
	CartList cartlist;
	@Autowired
	OrderDetailRepo orderrepo;
	@Autowired
	OrderList orderlist;
	@Autowired
	IptrackRepo iptrackrepo;
	
	
	@Autowired
	Password pass;
	
	@Lookup
	public Password getPasswordObject()
	{
		return null;
	}
	@Lookup
	public CartList getCartListObject()
	{
		return null;
	}
	@Lookup
	public OrderList getOrderListObject()
	{
		return null;
	}
	
	public void trackip(HttpSession session,HttpServletRequest request)
	{
		String ip=request.getRemoteAddr();
		String ip1=request.getHeader("X-Forwarded-For");
		System.out.println(ip1);
		Random rand=new Random();
		while(true)
		{
			String id=rand.nextInt(999999999)+"";
			Iptrack obj=iptrackrepo.findById(id).orElse(null);
			if(obj==null)
			{
				obj=new Iptrack();
				obj.setId(id);
				obj.setDate(new Date().toString());
				obj.setIpaddress(ip);
				iptrackrepo.save(obj);
				System.out.println(obj);
				session.setAttribute("ipaddress", obj);
				break;
			}
		}
		System.out.println("IP tracked");
	}
	
	public void checkCookie(HttpSession session,HttpServletRequest request)
	{
		String email=null,pass=null;
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)
		{
			for(Cookie cookie : cookies)
			{
				if(cookie.getName().equals("delta-user-email"))
					email=cookie.getValue();
				if(cookie.getName().equals("delta-user-pass"))
					pass=cookie.getValue();
			}
		}
		if(email!=null && pass!=null)
		{
			UserInfo user=userinforepo.findById(email).orElse(null);
			if(user!=null)
			{
				if(user.getPassword().equals(pass))
					session.setAttribute("deltaUser",user);
			}
		}
	}
	
	@RequestMapping("/")
	public String home(HttpSession session,HttpServletRequest request)
	{
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		return "home";
	}
	@RequestMapping("/{parent}")
	public ModelAndView category(@PathVariable("parent") String parent,HttpSession session,HttpServletRequest request)
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		List<Category> list=catrepo.findByParent(parent);
		catlist.setList(list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("catlist", catlist);
		switch (parent)
		{
		case "electronics":
			mv.setViewName("category");
			break;
		case "men's_wear":
			mv.setViewName("category1");
			break;
		case "women's_wear":
			mv.setViewName("category1");
			break;
		case "home_&_furniture":
			mv.setViewName("category");
		default:
			break;
		}
		return mv;
	}
	@RequestMapping("/electronics/{cat}")
	public void electronics(@PathVariable("cat") String cat,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/product");
		rd.forward(request, response);
	}
	@RequestMapping("/home_&_furniture/{cat}")
	public void homefurniture(@PathVariable("cat") String cat,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/product");
		rd.forward(request, response);
	}
	@RequestMapping("/women's_wear/{cat}")
	public void womens_wear(@PathVariable("cat") String cat,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/product1");
		rd.forward(request, response);
	}
	@RequestMapping("/men's_wear/{cat}")
	public void mens_wear(@PathVariable("cat") String cat,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/product1");
		rd.forward(request, response);
	}
	@RequestMapping("/product")
	public ModelAndView product(HttpServletRequest request,HttpSession session)
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		String cat=(String)request.getAttribute("cat");
		List<Product> list=prorepo.findByCategory(cat);
		prolist.setList(list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("prolist",prolist);
		mv.addObject("imgrepo", imgrepo);
		mv.setViewName("product");
		return mv;
	}
	@RequestMapping("/product1")
	public ModelAndView product1(HttpServletRequest request,HttpSession session)
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		String cat=(String)request.getAttribute("cat");
		List<Product> list=prorepo.findByCategory(cat);
		prolist.setList(list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("prolist",prolist);
		mv.addObject("imgrepo", imgrepo);
		mv.setViewName("product1");
		return mv;
	}
	@RequestMapping("/productview")
	public ModelAndView productview(@RequestParam("id") String id,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		String prev="";
		while(!prev.equals(id))
		{
			prev=id;
			id=URLDecoder.decode(id, "UTF-8");
		}
		Product pro=prorepo.findById(id).orElse(null);
		List<Image> list=imgrepo.findByPid(id);
		imglist.setList(list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("pro", pro);
		mv.addObject("imglist",imglist);
		mv.setViewName("productview");
		return mv;
	}
	@RequestMapping("/productview1")
	public ModelAndView productview1(@RequestParam("id") String id,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			checkCookie(session,request);
		}
		String prev="";
		while(!prev.equals(id))
		{
			prev=id;
			id=URLDecoder.decode(id, "UTF-8");
		}
		Product pro=prorepo.findById(id).orElse(null);
		List<Image> list=imgrepo.findByPid(id);
		imglist.setList(list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("pro", pro);
		mv.addObject("imglist",imglist);
		mv.setViewName("productview1");
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		checkCookie(session, request);
		if(session.getAttribute("deltaUser")!=null)
		{
			response.sendRedirect("/");
		}
		ModelAndView mv=new ModelAndView("login");
		return mv;
	}
	@PostMapping("/loginVerify")
	public void loginverify(LoginDetails detail,HttpSession session,HttpServletResponse response) throws IOException
	{
		pass=getPasswordObject();
		System.out.println(detail);
		UserInfo user=userinforepo.findById(detail.getEmail()).orElse(null);
		System.out.println(user);
		if(user!=null)
		{
			pass.setEmail(user.getEmail());
			pass.setPhone(user.getPhone());
			pass.setPass(detail.getPass());
			pass.generate();
			System.out.println(pass);
			if(pass.equals(user.getPassword()))
			{
				System.out.println("User Login Success");
				session.setAttribute("deltaUser",user);
				Cookie cookie=new Cookie("delta-user-email",user.getEmail());
				cookie.setMaxAge(60*60*24*30);
				Cookie cookie1=new Cookie("delta-user-pass",user.getPassword());
				cookie1.setMaxAge(60*60*24*30);
				response.addCookie(cookie);
				response.addCookie(cookie1);
				response.sendRedirect("/");
			}
			else
			{
				session.setAttribute("error", 1);
				response.sendRedirect("/login");
			}
		}
		else
		{
			session.setAttribute("error", 1);
			response.sendRedirect("/login");
		}
	}
	@RequestMapping("/register")
	public ModelAndView register(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		checkCookie(session, request);
		if(session.getAttribute("deltaUser")!=null)
		{
			response.sendRedirect("/");
		}
		ModelAndView mv=new ModelAndView("register");
		return mv;
	}
	@PostMapping("/registerVerify")
	public void registerverify(UserInfo user,HttpSession session,HttpServletResponse response) throws IOException
	{
		pass=getPasswordObject();
		System.out.println(user);
		pass.setEmail(user.getEmail());
		pass.setPhone(user.getPhone());
		pass.setPass(user.getPassword());
		pass.generate();
		user.setPassword(pass.getEncpass());
		userinforepo.save(user);
		session.setAttribute("deltaUser",user);
		Cookie cookie=new Cookie("delta-user-email",user.getEmail());
		cookie.setMaxAge(60*60*24*30);
		Cookie cookie1=new Cookie("delta-user-pass",user.getPassword());
		cookie1.setMaxAge(60*60*24*30);
		response.addCookie(cookie);
		response.addCookie(cookie1);
		response.sendRedirect("/");
		
	}
	@RequestMapping("/userdetail")
	public String userdetail(HttpSession session,HttpServletRequest request)
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		return "userdetail";
	}
	@PostMapping("/userdetailVerify")
	public void userdetailVerify(UserInfo user,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException
	{
		pass=getPasswordObject();
		System.out.println(user);
		UserInfo real=userinforepo.findById(user.getEmail()).orElse(null);
		pass.setEmail(real.getEmail());
		pass.setPhone(real.getPhone());
		pass.setPass(user.getPassword());
		pass.generate();
		if(pass.equals(real.getPassword()))
		{
			pass=getPasswordObject();
			pass.setEmail(user.getEmail());
			pass.setPhone(user.getPhone());
			pass.setPass(user.getPassword());
			pass.generate();
			user.setPassword(pass.getEncpass());
			userinforepo.save(user);
			session.setAttribute("deltaUser", user);
			Cookie[] cookies=request.getCookies();
			if(cookies!=null)
			{
				for(Cookie cookie : cookies)
				{
					if(cookie.getName().equals("delta-user-pass"))
					{
						cookie.setValue(user.getPassword());
						cookie.setMaxAge(60*60*24*30);
					}
				}
			}
			session.setAttribute("success",1);
		}
		else
			session.setAttribute("error",1);
		response.sendRedirect("userdetail");
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response)
	{
		session.removeAttribute("deltaUser");
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)
		{
			for(Cookie cookie : cookies)
			{
				if(cookie.getName().equals("delta-user-email"))
				{
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				if(cookie.getName().equals("delta-user-pass"))
				{
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		return "home";
	}
	
	@RequestMapping("/addtocart")
	public void addtocart(@RequestParam("pid") String pid,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException, InterruptedException
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		if(session.getAttribute("deltaUser")==null)
		{
			response.sendRedirect("/login");
		}
		else
		{
			String prev="";
			while(!prev.equals(pid))
			{
				prev=pid;
				pid=URLDecoder.decode(pid, "UTF-8");
			}
			Cart cart=new Cart();
			cart.setUid(((UserInfo)session.getAttribute("deltaUser")).getEmail());
			cart.setPid(pid);
			Random rand=new Random();
			while(true)
			{
				long id= rand.nextInt(100000000);
				if(cartrepo.findById(""+id).orElse(null)==null)
				{
					cart.setId(""+id);
					break;
				}
			}
			cartrepo.save(cart);
			response.sendRedirect("/cart");
		}
	}
	
	@RequestMapping("/cart")
	public ModelAndView cart(HttpSession session,HttpServletRequest request)
	{
		if(session.getAttribute("ipaddress")==null)
		{
			trackip(session,request);
		}
		String uid=((UserInfo)session.getAttribute("deltaUser")).getEmail();
		List<Cart> listc=cartrepo.findByUid(uid);
		cartlist=getCartListObject();
		cartlist.setList(listc);
		List<OrderDetail> listd=orderrepo.findByUid(uid);
		orderlist=getOrderListObject();
		orderlist.setList(listd);
		ModelAndView mv=new ModelAndView();
		mv.addObject("cartlist", cartlist);
		mv.addObject("orderlist", orderlist);
		mv.addObject("imgrepo", imgrepo);
		mv.addObject("prorepo",prorepo);
		mv.setViewName("cart");
		return mv;
	}
	@RequestMapping("/removefromcart")
	public void removefromcart(@RequestParam("id") String id,HttpServletResponse response,HttpSession session) throws IOException
	{
		if(session.getAttribute("deltaUser")==null)
		{
			response.sendRedirect("/");
		}
		cartrepo.deleteById(id);
		response.sendRedirect("/cart");
	}
	@RequestMapping("/confirmcartorder")
	public void confirmcartorder(@RequestParam("id") String id,HttpServletResponse response,HttpSession session) throws IOException
	{
		if(session.getAttribute("deltaUser")==null)
		{
			response.sendRedirect("/login");
		}
		Cart cart=cartrepo.findById(id).orElse(null);
		String pid=cart.getPid();
		cartrepo.deleteById(id);
		addToOrder(pid,(UserInfo)session.getAttribute("deltaUser"));
		response.sendRedirect("/cart");
	}
	public void addToOrder(String pid,UserInfo user)
	{
		Product pro=prorepo.findById(pid).orElse(null);
		OrderDetail order=new OrderDetail();
		LocalDate date =  LocalDate.now();
		order.setOrderdate(date.toString());
		order.setDeliverydate(date.plusDays(5).toString());
		order.setUid(user.getEmail());
		order.setPid(pid);
		if(pro.getDprice()==0)
			order.setPrice(pro.getPrice());
		else
			order.setPrice(pro.getDprice());
		Random rand=new Random();
		while(true)
		{
			long id= rand.nextInt(100000000);
			if(orderrepo.findById(""+id).orElse(null)==null)
			{
				order.setOid(""+id);
				break;
			}
		}
		orderrepo.save(order);
	}
	@RequestMapping("/buynow")
	public void buynow(@RequestParam("pid") String pid,HttpSession session,HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("deltaUser")==null)
		{
			response.sendRedirect("/login");
		}
		else
		{
			String prev="";
			while(!prev.equals(pid))
			{
				prev=pid;
				pid=URLDecoder.decode(pid, "UTF-8");
			}
			addToOrder(pid,(UserInfo)session.getAttribute("deltaUser"));
			response.sendRedirect("/cart");
		}
	}
	
	@RequestMapping("/cancelorder")
	public void cancelorder(@RequestParam("oid") String oid,HttpServletResponse response,HttpSession session) throws IOException
	{
		if(session.getAttribute("deltaUser")==null)
		{
			response.sendRedirect("/login");
		}
		OrderDetail order=orderrepo.findById(oid).orElse(null);
		orderrepo.delete(order);
		response.sendRedirect("/cart");
	}
}
