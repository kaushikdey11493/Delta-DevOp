package com.delta.admincontrollers;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delta.admincontrollers.dao.*;
import com.delta.admincontrollers.models.*;

@Controller
public class ExtractData
{
	@Autowired
	AdminLogRepo logrepo;
	@Autowired
	CartRepo cartrepo;
	@Autowired
	CategoryRepo catrepo;
	@Autowired
	CompanyRepo comprepo;
	@Autowired
	EmployeeRepo emprepo;
	@Autowired
	ImageRepo imgrepo;
	@Autowired
	OrderDetailRepo orderrepo;
	@Autowired
	ProductRepo prorepo;
	@Autowired
	UserInfoRepo userrepo;
	@Autowired
	IptrackRepo iprepo;
	
	
	@RequestMapping("/extract")
	@ResponseBody
	public String extract() throws IOException
	{
		System.out.println("Extraction started");
		FileWriter fw=new FileWriter("AdminLog");
		BufferedWriter bw=new BufferedWriter(fw);
		PrintWriter pw=new PrintWriter(bw);
		List<AdminLog> list=logrepo.findAll();
		for(AdminLog i : list)
			pw.println(i.getEmail()+"<@@@>"+i.getDate_time());
		pw.close();
		bw.close();
		fw.close();
		System.out.println("Extraction ended");

		System.out.println("Extraction started");
		FileWriter fw1=new FileWriter("Cart");
		BufferedWriter bw1=new BufferedWriter(fw1);
		PrintWriter pw1=new PrintWriter(bw1);
		List<Cart> list1=cartrepo.findAll();
		for(Cart obj : list1)
			pw1.println(obj.getUid()+"<@@@>"+obj.getPid()+"<@@@>"+obj.getId());
		pw1.close();
		bw1.close();
		fw1.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw2=new FileWriter("Category");
		BufferedWriter bw2=new BufferedWriter(fw2);
		PrintWriter pw2=new PrintWriter(bw2);
		List<Category> list2=catrepo.findAll();
		for(Category obj : list2)
			pw2.println(obj.getCatid()+"<@@@>"+obj.getCatname()+"<@@@>"+obj.getImgsrc()+"<@@@>"+obj.getParent());
		pw2.close();
		bw2.close();
		fw2.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw3=new FileWriter("Company");
		BufferedWriter bw3=new BufferedWriter(fw3);
		PrintWriter pw3=new PrintWriter(bw3);
		List<Company> list3=comprepo.findAll();
		for(Company obj : list3)
			pw3.println(obj.getCid()+"<@@@>"+obj.getCname()+"<@@@>"+obj.getCwebsite()+"<@@@>"+obj.getNoofpro()+"<@@@>"+obj.getCountry());
		pw3.close();
		bw3.close();
		fw3.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw4=new FileWriter("Employee");
		BufferedWriter bw4=new BufferedWriter(fw4);
		PrintWriter pw4=new PrintWriter(bw4);
		List<Employee> list4=emprepo.findAll();
		for(Employee obj : list4)
			pw4.println(obj.getEmail()+"<@@@>"+obj.getName()+"<@@@>"+obj.getPhone()+"<@@@>"+obj.getAddress()+"<@@@>"+obj.getPassword()+"<@@@>"+
						obj.getJobid());
		pw4.close();
		bw4.close();
		fw4.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw5=new FileWriter("Imagef");
		BufferedWriter bw5=new BufferedWriter(fw5);
		PrintWriter pw5=new PrintWriter(bw5);
		List<Image> list5=imgrepo.findAll();
		for(Image obj : list5)
			pw5.println(obj.getPid()+"<@@@>"+obj.getImgsrc());
		pw5.close();
		bw5.close();
		fw5.close();
		System.out.println("Extraction ended");
		
		
		System.out.println("Extraction started");
		FileWriter fw6=new FileWriter("OrderDetail");
		BufferedWriter bw6=new BufferedWriter(fw6);
		PrintWriter pw6=new PrintWriter(bw6);
		List<OrderDetail> list6=orderrepo.findAll();
		for(OrderDetail obj : list6)
			pw6.println(obj.getUid()+"<@@@>"+obj.getPid()+"<@@@>"+obj.getOrderdate()+"<@@@>"+obj.getDeliverydate()+"<@@@>"+
		obj.getOid()+"<@@@>"+obj.getPrice());
		pw6.close();
		bw6.close();
		fw6.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw7=new FileWriter("Product");
		BufferedWriter bw7=new BufferedWriter(fw7);
		PrintWriter pw7=new PrintWriter(bw7);
		List<Product> list7=prorepo.findAll();
		for(Product obj : list7)
			pw7.println(obj.getPid()+"<@@@>"+obj.getPname()+"<@@@>"+obj.getCid()+"<@@@>"+obj.getPdetails()+"<@@@>"+
		obj.getPrice()+"<@@@>"+obj.getDprice()+"<@@@>"+obj.getEmpid()+"<@@@>"+obj.getCategory());
		pw7.close();
		bw7.close();
		fw7.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw8=new FileWriter("UserInfo");
		BufferedWriter bw8=new BufferedWriter(fw8);
		PrintWriter pw8=new PrintWriter(bw8);
		List<UserInfo> list8=userrepo.findAll();
		for(UserInfo obj : list8)
			pw8.println(obj.getEmail()+"<@@@>"+obj.getName()+"<@@@>"+obj.getPhone()+"<@@@>"+obj.getPassword()+"<@@@>"+
					obj.getCountry()+"<@@@>"+obj.getState()+"<@@@>"+obj.getCity()+"<@@@>"+obj.getTown()+"<@@@>"+obj.getStreet_no()+"<@@@>"+
					obj.getHouse_no()+"<@@@>"+obj.getNearby());
		pw8.close();
		bw8.close();
		fw8.close();
		System.out.println("Extraction ended");
		
		System.out.println("Extraction started");
		FileWriter fw9=new FileWriter("Iptrack");
		BufferedWriter bw9=new BufferedWriter(fw9);
		PrintWriter pw9=new PrintWriter(bw9);
		List<Iptrack> list9=iprepo.findAll();
		for(Iptrack obj : list9)
			pw9.println(obj.getId()+"<@@@>"+obj.getIpaddress()+"<@@@>"+obj.getDate()+"<@@@>"+obj.getDetail());
		pw9.close();
		bw9.close();
		fw9.close();
		System.out.println("Extraction ended");
		
		return "Total Extraction Done . Saved to Files";
		
	}
	
	@RequestMapping("/extract/adminlog")
	@ResponseBody
	public String adminlog()
	{
		String s="";
		List<AdminLog> list=logrepo.findAll();
		for(AdminLog i : list)
			s=s+i.getEmail()+"<@@@>"+i.getDate_time()+"<br>";
		return s;
	}
	@RequestMapping("/extract/cart")
	@ResponseBody
	public String cart()
	{
		String s="";
		List<Cart> list1=cartrepo.findAll();
		for(Cart obj : list1)
			s=s+obj.getUid()+"<@@@>"+obj.getPid()+"<@@@>"+obj.getId()+"<br>";
		return s;
	}
	
	@RequestMapping("/extract/category")
	@ResponseBody
	public String category()
	{
		String s="";
		List<Category> list2=catrepo.findAll();
		for(Category obj : list2)
			s=s+obj.getCatid()+"<@@@>"+obj.getCatname()+"<@@@>"+obj.getImgsrc()+"<@@@>"+obj.getParent()+"<br>";
		return s;
	}
	
	@RequestMapping("/extract/company")
	@ResponseBody
	public String company()
	{
		String s="";
		List<Company> list3=comprepo.findAll();
		for(Company obj : list3)
			s=s+obj.getCid()+"<@@@>"+obj.getCname()+"<@@@>"+obj.getCwebsite()+"<@@@>"+obj.getNoofpro()+"<@@@>"+obj.getCountry()+"<br>";
		return s;
	}
	
	@RequestMapping("/extract/employee")
	@ResponseBody
	public String employee()
	{
		String s="";
		List<Employee> list4=emprepo.findAll();
		for(Employee obj : list4)
			s=s+obj.getEmail()+"<@@@>"+obj.getName()+"<@@@>"+obj.getPhone()+"<@@@>"+obj.getAddress()+"<@@@>"+obj.getPassword()+"<@@@>"+
						obj.getJobid()+"<br>";
		return s;		
	}
	@RequestMapping("/extract/image")
	@ResponseBody
	public String image()
	{
		String s="";
		List<Image> list5=imgrepo.findAll();
		for(Image obj : list5)
			s=s+obj.getPid()+"<@@@>"+obj.getImgsrc()+"<br>";
		return s;		
	}
	@RequestMapping("/extract/orderdetail")
	@ResponseBody
	public String orderdetail()
	{
		String s="";
		List<OrderDetail> list6=orderrepo.findAll();
		for(OrderDetail obj : list6)
			s=s+obj.getUid()+"<@@@>"+obj.getPid()+"<@@@>"+obj.getOrderdate()+"<@@@>"+obj.getDeliverydate()+"<@@@>"+
		obj.getOid()+"<@@@>"+obj.getPrice()+"<br>";
		return s;	
	}
	@RequestMapping("/extract/product")
	@ResponseBody
	public String product()
	{
		String s="";
		List<Product> list7=prorepo.findAll();
		for(Product obj : list7)
			s=s+obj.getPid()+"<@@@>"+obj.getPname()+"<@@@>"+obj.getCid()+"<@@@>"+obj.getPdetails()+"<@@@>"+
		obj.getPrice()+"<@@@>"+obj.getDprice()+"<@@@>"+obj.getEmpid()+"<@@@>"+obj.getCategory()+"<br>";
		return s;	
	}
	@RequestMapping("/extract/userinfo")
	@ResponseBody
	public String userinfo()
	{
		String s="";
		List<UserInfo> list8=userrepo.findAll();
		for(UserInfo obj : list8)
			s=s+obj.getEmail()+"<@@@>"+obj.getName()+"<@@@>"+obj.getPhone()+"<@@@>"+obj.getPassword()+"<@@@>"+
					obj.getCountry()+"<@@@>"+obj.getState()+"<@@@>"+obj.getCity()+"<@@@>"+obj.getTown()+"<@@@>"+obj.getStreet_no()+"<@@@>"+
					obj.getHouse_no()+"<@@@>"+obj.getNearby()+"<br>";
		return s;	
	}
	@RequestMapping("/extract/iptrack")
	@ResponseBody
	public String iptrack()
	{
		String s="";
		List<Iptrack> list8=iprepo.findAll();
		for(Iptrack obj : list8)
			s=s+obj.getId()+"<@@@>"+obj.getIpaddress()+"<@@@>"+obj.getDate()+"<@@@>"+obj.getDetail()+"<br>";
		return s;	
	}
	
}
