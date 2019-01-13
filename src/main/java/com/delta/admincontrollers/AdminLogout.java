package com.delta.admincontrollers;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLogout 
{
	@RequestMapping("/admin/logout")
	public void logout(HttpSession session,HttpServletResponse response) throws IOException
	{
		session.removeAttribute("delta-login-as");
		session.removeAttribute("deltaLoginDetails");
		response.sendRedirect("/administrationLogin");
	}
}
