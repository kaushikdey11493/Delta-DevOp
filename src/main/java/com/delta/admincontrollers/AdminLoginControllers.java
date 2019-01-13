package com.delta.admincontrollers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Lookup;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.delta.admincontrollers.dao.AdminLogRepo;
import com.delta.admincontrollers.dao.EmployeeRepo;
import com.delta.admincontrollers.models.AdminLog;
import com.delta.admincontrollers.models.Employee;
import com.delta.admincontrollers.models.LoginDetails;
import com.delta.encpass.Password;

@Controller 
public class AdminLoginControllers 
{
	@Autowired
	EmployeeRepo emprepo;
	
	@Autowired
	AdminLogRepo adminLogRepo;
	
	@Autowired
	Password pass;
	
	@Lookup
	public Password getPasswordObject()
	{
		return null;
	}
	
	@RequestMapping("/administrationLogin")
	public ModelAndView adminLogin()
	{
		ModelAndView mv=new ModelAndView("administrationLogin");
		return mv; 
	}
	@RequestMapping("/administratorLogin")
	public ModelAndView administratorLogin(HttpSession session,HttpServletResponse response) throws Exception
	{
		if(session.getAttribute("delta-login-as")!=null && session.getAttribute("delta-login-as").equals("administrator"))
		{
			response.sendRedirect("/administrator");
		}
		ModelAndView mv=new ModelAndView("adminLogin");
		session.setAttribute("delta-login","administratorVerify");
		return mv;
	}
	@RequestMapping("/product_managerLogin")
	public ModelAndView product_manager(HttpSession session,HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("delta-login-as")!=null && session.getAttribute("delta-login-as").equals("product_manager"))
		{
			response.sendRedirect("/product_manager");
		}
		ModelAndView mv=new ModelAndView("adminLogin");
		session.setAttribute("delta-login","product_managerVerify");
		return mv;
	}
	@RequestMapping("/product_delivery_managerLogin")
	public ModelAndView productdeliverymanager(HttpSession session,HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("delta-login-as")!=null && session.getAttribute("delta-login-as").equals("product_delivery_manager"))
		{
			response.sendRedirect("/administrator");
		}
		ModelAndView mv=new ModelAndView("adminLogin");
		session.setAttribute("delta-login","product_delivery_managerVerify");
		return mv;
	}
	@RequestMapping("/administratorVerify")
	public void administrator(HttpSession session,LoginDetails detail,HttpServletResponse response)throws Exception
	{
			pass=getPasswordObject();
			System.out.println(detail);
			session.removeAttribute("delta-login");
			Employee admin=emprepo.findById(detail.getEmail()).orElse(null);
			System.out.println(admin);
			if(admin!=null && admin.getJobid().equals("administrator"))
			{
				pass.setEmail(admin.getEmail());
				pass.setPhone(admin.getPhone());
				pass.setPass(detail.getPass());
				pass.generate();
				System.out.println(pass);
				if(pass.equals(admin.getPassword()))
				{
					System.out.println("Administrator Login Success");
					session.setAttribute("delta-login-as","administrator");
					session.setAttribute("deltaLoginDetails",admin);
					AdminLog log=new AdminLog(admin.getEmail(),new Date().toString());
					adminLogRepo.save(log);
					response.sendRedirect("/administrator");
				}
				else
				{
					session.setAttribute("error", 1);
					response.sendRedirect("/administrationLogin");
				}
			}
			else
			{
				session.setAttribute("error", 1);
				response.sendRedirect("/administrationLogin");
			}
	
	}
	
	@RequestMapping("/product_managerVerify")
	public void product_manager(HttpSession session,LoginDetails detail,HttpServletResponse response)throws Exception
	{
			pass=getPasswordObject();
			System.out.println(detail);
			session.removeAttribute("delta-login");
			Employee admin=emprepo.findById(detail.getEmail()).orElse(null);
			System.out.println(admin);
			if(admin!=null && admin.getJobid().equals("product_manager"))
			{
				pass.setEmail(admin.getEmail());
				pass.setPhone(admin.getPhone());
				pass.setPass(detail.getPass());
				pass.generate();
				System.out.println(pass);
				if(pass.equals(admin.getPassword()))
				{
					System.out.println("Administrator Login Success");
					session.setAttribute("delta-login-as","product_manager");
					session.setAttribute("deltaLoginDetails",admin);
					AdminLog log=new AdminLog(admin.getEmail(),new Date().toString());
					adminLogRepo.save(log);
					response.sendRedirect("/product_manager");
				}
				else
				{
					session.setAttribute("error", 1);
					response.sendRedirect("/administrationLogin");
				}
			}
			else
			{
				session.setAttribute("error", 1);
				response.sendRedirect("/administrationLogin");
			}
	
	}
	@RequestMapping("/product_delivery_managerVerify")
	public void product_delivery_manager(HttpSession session,LoginDetails detail,HttpServletResponse response)throws Exception
	{
		pass=getPasswordObject();
		System.out.println(detail);
			session.removeAttribute("delta-login");
			Employee admin=emprepo.findById(detail.getEmail()).orElse(null);
			System.out.println(admin);
			if(admin!=null && admin.getJobid().equals("product_delivery_manager"))
			{
				pass.setEmail(admin.getEmail());
				pass.setPhone(admin.getPhone());
				pass.setPass(detail.getPass());
				pass.generate(); 
				System.out.println(pass);
				if(pass.equals(admin.getPassword()))
				{
					System.out.println("Administrator Login Success");
					session.setAttribute("delta-login-as","product_delivery_manager");
					session.setAttribute("deltaLoginDetails",admin);
					AdminLog log=new AdminLog(admin.getEmail(),new Date().toString());
					adminLogRepo.save(log);
					response.sendRedirect("/delivery_manager");
				}
				else
				{
					session.setAttribute("error", 1);
					response.sendRedirect("/administrationLogin");
				}
			}
			else
			{
				session.setAttribute("error", 1);
				response.sendRedirect("/administrationLogin");
			}
	}
	public static String uploadDirectory = System.getProperty("user.dir")+"/uploads";
	@RequestMapping("/up")
	public String uploadPage()
	{
		return "upload";
	}
	@RequestMapping("/upload")
	  public ModelAndView upload(@RequestParam("files") MultipartFile[] files) {
		  StringBuilder fileNames = new StringBuilder();
		  for (MultipartFile file : files) {
			  Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			  fileNames.append(file.getOriginalFilename()+" ");
			  try {
				Files.write(fileNameAndPath, file.getBytes());
				System.out.println(fileNameAndPath);
			} catch (IOException e) {
				e.printStackTrace();
			}
		  }
		  ModelAndView mv=new ModelAndView("status");
		  mv.addObject("msg", "Successfully uploaded files "+fileNames.toString());
		  return mv;
	  }
}
