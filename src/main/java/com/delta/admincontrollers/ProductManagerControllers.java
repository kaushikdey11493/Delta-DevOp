package com.delta.admincontrollers;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.delta.admincontrollers.dao.CategoryRepo;
import com.delta.admincontrollers.dao.CompanyRepo;
import com.delta.admincontrollers.dao.EmployeeRepo;
import com.delta.admincontrollers.dao.ImageRepo;
import com.delta.admincontrollers.dao.ProductRepo;
import com.delta.admincontrollers.models.Category;
import com.delta.admincontrollers.models.CategoryList;
import com.delta.admincontrollers.models.Company;
import com.delta.admincontrollers.models.CompanyList;
import com.delta.admincontrollers.models.Employee;
import com.delta.admincontrollers.models.Image;
import com.delta.admincontrollers.models.ImageList;
import com.delta.admincontrollers.models.Product;
import com.delta.admincontrollers.models.ProductList;

@Controller
public class ProductManagerControllers
{
	@Autowired
	EmployeeRepo emprepo;
	@Autowired
	ProductRepo prorepo;
	@Autowired
	ProductList prolist;
	@Autowired
	CategoryRepo catrepo;
	@Autowired
	CategoryList catlist;
	@Autowired
	CompanyRepo comprepo;
	@Autowired
	CompanyList complist;
	@Autowired
	ImageRepo imgrepo;
	@Autowired
	ImageList imglist;
	
	private String uploadDirectory=System.getProperty("user.dir");
	
	private void securityCheck(HttpSession session,HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("delta-login-as")==null)
			response.sendRedirect("/administrationLogin");
		else if(!session.getAttribute("delta-login-as").equals("product_manager"))
		{
			response.sendRedirect("/administrationLogin");
		}
	}
	
	@RequestMapping("/product_manager")
	public ModelAndView administrator(HttpSession session,HttpServletResponse response) throws Exception
	{
		securityCheck(session, response);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product_manager");
		return mv; 
	}
	
	
	/*Category*/
	@RequestMapping("/product_manager/category")
	public ModelAndView category(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		List<Category> list=catrepo.findAll();
		catlist.setList(list);
		ModelAndView mv=new ModelAndView("category");
		mv.addObject("catlist", catlist);
		return mv;
	}
	@RequestMapping("/product_manager/category/add")
	public ModelAndView addcategory(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		List<Category> list=catrepo.findAll();
		catlist.setList(list);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("addCategory");
		mv.addObject("catlist", catlist);
		return mv;
	}
	@RequestMapping("/product_manager/category/add/verify")
	public void addcategory(@RequestParam("catid") String catid,@RequestParam("catname") String catname,@RequestParam("imgsrc") MultipartFile imgsrc,@RequestParam("parent") String parent,HttpServletResponse response,HttpSession session) throws Exception
	{
		securityCheck(session, response);
		String code="",f="";
		Random rand=new Random();
		int c=0;
		if(imgsrc.getSize()!=0)
		{
			while(c==0)
			{
				code="IMG_"+rand.nextInt(1000000)+"_"+rand.nextInt(1000000)+".jpg";
				f="image/"+code;
				File file=new File(uploadDirectory+"/"+f);
				if(!file.exists())
				{
					c=1;
				}
			}
		}
		Category cat=new Category();
		catid=catid.toLowerCase();
		while(catid.indexOf(' ')>0)
		{
			catid=catid.substring(0, catid.indexOf(' '))+"_"+catid.substring(catid.indexOf(' ')+1);
		}
		cat.setCatid(catid);
		cat.setCatname(catname);
		if(code.equals(""))
			cat.setImgsrc("image/noimage.png");
		else
			cat.setImgsrc(f);
		cat.setParent(parent);
		if(!code.equals(""))
		{
			Path fileNameAndPath = Paths.get(uploadDirectory, cat.getImgsrc());
			try
			{
				Files.write(fileNameAndPath, imgsrc.getBytes());
				System.out.println(fileNameAndPath);
				catrepo.save(cat);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else
			catrepo.save(cat);
		response.sendRedirect("/product_manager/category");
	}
	@RequestMapping("/product_manager/category/remove")
	public void removecategory(@RequestParam String id,HttpServletResponse response,HttpSession session) throws IOException
	{
		securityCheck(session, response);
		String prev="";
		while(!prev.equals(id))
		{
			prev=id;
			id=URLDecoder.decode(id, "UTF-8");
		}
		List<Category> list=catrepo.findByParent(id);
		if(list.size()>0)
			session.setAttribute("error", 1);
		else
		{
			Category cat=catrepo.findById(id).orElse(null);
			File file=new File(uploadDirectory+"/"+cat.getImgsrc());
			file.delete();
			catrepo.deleteById(id);
		}
		response.sendRedirect("/product_manager/category");
	}

	/*Product*/
	
	@RequestMapping("/product_manager/product")
	public ModelAndView product(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		List<Product> list=prorepo.findAll();
		prolist.setList(list);
		ModelAndView mv=new ModelAndView("product");
		mv.addObject("prolist", prolist);
		mv.addObject("imgrepo",imgrepo);
		return mv;
	}
	@RequestMapping("/product_manager/product/add")
	public ModelAndView addproduct(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		complist.setList(comprepo.findAll());
		catlist.setList(catrepo.findAll());
		ModelAndView mv=new ModelAndView("addProduct");
		mv.addObject("complist", complist);
		mv.addObject("catlist", catlist);
		return mv;
	}
	@RequestMapping("/product_manager/product/add/verify")
	public void addProduct(Product pro,HttpServletResponse response,HttpSession session) throws Exception
	{
		securityCheck(session, response);
		Company comp=comprepo.findById(pro.getCid()).orElse(null);
		comp.setNoofpro(comp.getNoofpro()+1);
		comprepo.save(comp);
		System.out.println(pro);
		prorepo.save(pro);
		response.sendRedirect("/product_manager/product");
	}
	@RequestMapping("/product_manager/product/remove")
	public void removeProduct(@RequestParam String id,HttpServletResponse response,HttpSession session) throws IOException
	{
		securityCheck(session, response);
		String prev="";
		while(!prev.equals(id))
		{
			prev=id;
			id=URLDecoder.decode(id, "UTF-8");
		}
		deleteAllImages(id);
		prorepo.deleteById(id);
		response.sendRedirect("/product_manager/product");
	}
	@RequestMapping("/product_manager/product/view")
	public ModelAndView productView(@RequestParam String id,HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		String prev="";
		while(!prev.equals(id))
		{
			prev=id;
			id=URLDecoder.decode(id, "UTF-8");
		}
		Product pro=prorepo.findById(id).orElse(null);
		Company comp=comprepo.findById(pro.getCid()).orElse(null);
		Employee emp=emprepo.findById(pro.getEmpid()).orElse(null);
		List<Image> imgs=imgrepo.findByPid(pro.getPid());
		imglist.setList(imgs);
		ModelAndView mv=new ModelAndView("view");
		mv.addObject("product",pro);
		mv.addObject("company", comp);
		mv.addObject("employee", emp);
		mv.addObject("imglist", imglist);
		return mv;
	}
	@RequestMapping("/product_manager/product/update")
	public ModelAndView productUpdate(@RequestParam String id,HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		Product pro=prorepo.findById(id).orElse(null);
		Company comp=comprepo.findById(pro.getCid()).orElse(null);
		ModelAndView mv=new ModelAndView("update");
		mv.addObject("product",pro);
		mv.addObject("company", comp);
		return mv;
	}
	@RequestMapping("/product_manager/product/update/verify")
	public void productUpdateVerify(Product pro1,HttpServletResponse response,HttpSession session) throws IOException
	{
		securityCheck(session, response);
		prorepo.save(pro1);
		response.sendRedirect("/product_manager/product");
	}
	@RequestMapping("/product_manager/product/addImage")
	public void addImage(@RequestParam("pid") String pid,@RequestParam("files") MultipartFile[] files,HttpSession session,HttpServletResponse response)throws Exception
	{	
		securityCheck(session, response);
		for (MultipartFile file : files)
		{
			Image img=getImageInfo();
			Path fileNameAndPath = Paths.get(uploadDirectory, "src/main/webapp/"+img.getImgsrc());
			try
			{
				Files.write(fileNameAndPath, file.getBytes());
				System.out.println(fileNameAndPath);
				img.setPid(pid);
				imgrepo.save(img);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("/product_manager/product/view?id="+URLEncoder.encode(pid, "UTF-8"));
	}
	private Image getImageInfo()
	{
		Random rand=new Random();
		int c=0;
		Image img=new Image();
		while(c==0)
		{
			String code="IMG_"+rand.nextInt(1000000)+"_"+rand.nextInt(1000000)+".jpg";
			String f="image/"+code;
			File file=new File(uploadDirectory+"/"+f);
			if(!file.exists())
			{
				img.setImgsrc(f);
				c=1;
			}
		}
		return img;
	}
	@RequestMapping("/product_manager/product/removeImage")
	public void removeImage(@RequestParam String id,@RequestParam String pid,HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		String prev="";
		while(!prev.equals(pid))
		{
			prev=pid;
			pid=URLDecoder.decode(pid, "UTF-8");
		}
		File file=new File(uploadDirectory+"/src/main/webapp/"+id);
		file.delete();
		imgrepo.deleteById(id);
		response.sendRedirect("/product_manager/product/view?id="+URLEncoder.encode(pid, "UTF-8"));
	}
	private void deleteAllImages(String pid)
	{
		List<Image> list=imgrepo.findByPid(pid);
		for(Image img : list)
		{
			File file=new File(uploadDirectory+"/"+img.getImgsrc());
			file.delete();
			imgrepo.delete(img);
		}
		
	}
	

	/*Company*/
	@RequestMapping("/product_manager/company")
	public ModelAndView company(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		complist.setList(comprepo.findAll());
		ModelAndView mv=new ModelAndView("company");
		mv.addObject("complist", complist);
		return mv;
	}
	@RequestMapping("/product_manager/company/add")
	public ModelAndView addcompany(HttpSession session,HttpServletResponse response) throws IOException
	{
		securityCheck(session, response);
		ModelAndView mv=new ModelAndView("addCompany");
		return mv;
	}
	@RequestMapping("/product_manager/company/add/verify")
	public void addcompany(Company comp,HttpSession session,HttpServletResponse response) throws Exception
	{
		securityCheck(session, response);
		comprepo.save(comp);
		response.sendRedirect("/product_manager/company");
	}
	@RequestMapping("/product_manager/company/remove")
	public void removecompany(@RequestParam String id,HttpServletResponse response,HttpSession session) throws IOException
	{
		securityCheck(session, response);
		List<Product> list=prorepo.findByCid(id);
		if(list.size()>0)
		{
			session.setAttribute("error", 1);
		}
		else
			comprepo.deleteById(id);
		response.sendRedirect("/product_manager/company");
	}
	@RequestMapping("/product_manager/company/view")
	public ModelAndView viewCompany(@RequestParam String id,HttpServletResponse response,HttpSession session) throws IOException
	{
		securityCheck(session, response);
		Company comp=comprepo.findById(id).orElse(null);
		ModelAndView mv=new ModelAndView("view");
		mv.addObject("comp",comp);
		return mv;
	}
	
}
