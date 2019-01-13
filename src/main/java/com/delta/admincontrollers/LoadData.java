package com.delta.admincontrollers;

import java.io.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delta.admincontrollers.dao.AdminLogRepo;
import com.delta.admincontrollers.dao.CartRepo;
import com.delta.admincontrollers.dao.CategoryRepo;
import com.delta.admincontrollers.dao.CompanyRepo;
import com.delta.admincontrollers.dao.EmployeeRepo;
import com.delta.admincontrollers.dao.ImageRepo;
import com.delta.admincontrollers.dao.IptrackRepo;
import com.delta.admincontrollers.dao.OrderDetailRepo;
import com.delta.admincontrollers.dao.ProductRepo;
import com.delta.admincontrollers.dao.UserInfoRepo;
import com.delta.admincontrollers.models.*;

@Controller
public class LoadData 
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
	
	
	@RequestMapping("/load")
	@ResponseBody
	public String load() throws IOException
	{
		String s="";
		System.out.println("Loading started");
		FileReader fr=new FileReader("AdminLog");
		BufferedReader br=new BufferedReader(fr);
		while((s=br.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				AdminLog log=new AdminLog();
				log.setEmail(arr[0]);
				log.setDate_time(arr[1]);
				logrepo.save(log);
			}
		}
		br.close();
		fr.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr1=new FileReader("Cart");
		BufferedReader br1=new BufferedReader(fr1);
		while((s=br1.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Cart cart=new Cart();
				cart.setUid(arr[0]);
				cart.setPid(arr[1]);
				cart.setId(arr[2]);
				cartrepo.save(cart);
			}
		}
		br1.close();
		fr1.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr2=new FileReader("Category");
		BufferedReader br2=new BufferedReader(fr2);
		while((s=br2.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Category cat=new Category();
				cat.setCatid(arr[0]);
				cat.setCatname(arr[1]);
				cat.setImgsrc(arr[2]);
				try {
					cat.setParent(arr[3]);
				} catch (Exception e) {
					cat.setParent("");
				}
				catrepo.save(cat);
			}
		}
		br2.close();
		fr2.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr3=new FileReader("Company");
		BufferedReader br3=new BufferedReader(fr3);
		while((s=br3.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Company comp=new Company();
				comp.setCid(arr[0]);
				comp.setCname(arr[1]);
				comp.setCwebsite(arr[2]);
				comp.setNoofpro(Integer.parseInt(arr[3]));;
				comp.setCountry(arr[4]);
				comprepo.save(comp);
			}
		}
		br3.close();
		fr3.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr4=new FileReader("Employee");
		BufferedReader br4=new BufferedReader(fr4);
		while((s=br4.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Employee emp=new Employee();
				emp.setEmail(arr[0]);
				emp.setName(arr[1]);
				emp.setPhone(arr[2]);
				emp.setAddress(arr[3]);
				emp.setPassword(arr[4]);
				emp.setJobid(arr[5]);
				emprepo.save(emp);
			}
		}
		br4.close();
		fr4.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr5=new FileReader("Imagef");
		BufferedReader br5=new BufferedReader(fr5);
		while((s=br5.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Image img=new Image();
				img.setPid(arr[0]);
				img.setImgsrc(arr[1]);
				imgrepo.save(img);
			}
		}
		br5.close();
		fr5.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr6=new FileReader("OrderDetail");
		BufferedReader br6=new BufferedReader(fr6);
		while((s=br6.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				OrderDetail order=new OrderDetail();
				order.setUid(arr[0]);
				order.setPid(arr[1]);
				order.setOrderdate(arr[2]);
				order.setDeliverydate(arr[3]);
				order.setOid(arr[4]);
				order.setPrice(Double.parseDouble(arr[5]));
				orderrepo.save(order);
			}
		}
		br6.close();
		fr6.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr7=new FileReader("Product");
		BufferedReader br7=new BufferedReader(fr7);
		while((s=br7.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Product pro=new Product();
				System.out.println(arr[0]);
				pro.setPid(arr[0]);
				System.out.println(arr[1]);
				pro.setPname(arr[1]);
				System.out.println(arr[2]);
				pro.setCid(arr[2]);
				System.out.println(arr[3]);
				pro.setPdetails(arr[3]);
				System.out.println(arr[4]);
				pro.setPrice(Double.parseDouble(arr[4]));
				System.out.println(arr[5]);
				pro.setDprice(Double.parseDouble(arr[5]));
				System.out.println(arr[6]);
				pro.setEmpid(arr[6]);
				System.out.println(arr[7]);
				pro.setCategory(arr[7]);
				prorepo.save(pro);
			}
		}
		br7.close();
		fr7.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr8=new FileReader("UserInfo");
		BufferedReader br8=new BufferedReader(fr8);
		while((s=br8.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				UserInfo user=new UserInfo();
				user.setEmail(arr[0]);
				user.setName(arr[1]);
				user.setPhone(arr[2]);
				user.setPassword(arr[3]);
				user.setCountry(arr[4]);
				user.setState(arr[5]);
				user.setCity(arr[6]);
				user.setTown(arr[7]);
				try{
					user.setStreet_no(arr[8]);
				}catch (Exception e) {
					user.setStreet_no("");
				}
				try
				{
					user.setHouse_no(arr[9]);
				}catch (Exception e) {
					user.setHouse_no("");
				}
				try{
					user.setNearby(arr[10]);
				}catch (Exception e) {
					user.setNearby("");
				}
				userrepo.save(user);
			}
		}
		br8.close();
		fr8.close();
		System.out.println("Loading ended");
		
		System.out.println("Loading started");
		FileReader fr9=new FileReader("Iptrack");
		BufferedReader br9=new BufferedReader(fr9);
		while((s=br9.readLine())!=null)
		{
			if(!s.equals(""))
			{
				String arr[]=s.split("<@@@>");
				Iptrack obj=new Iptrack();
				obj.setId(arr[0]);
				obj.setIpaddress(arr[1]);
				obj.setDate(arr[2]);
				try{
					obj.setDetail(arr[3]);
				}catch (Exception e) {
					obj.setDetail(null);
				}
				iprepo.save(obj);
			}
		}
		br8.close();
		fr8.close();
		System.out.println("Loading ended");
		
		return "Total Data Loaded";
	}
}
