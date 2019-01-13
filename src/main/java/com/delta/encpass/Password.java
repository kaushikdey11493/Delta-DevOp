package com.delta.encpass;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value="prototype")
public class Password
{
	private String email;
	private String phone;
	private String pass;
	private String encpass="";
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void generate()
	{
		int i=0,j[]=new int[3];
		while(true)
		{
			if(i<email.length())
				encpass=encpass+email.charAt(i);
			else
				j[0]=1;
			if(i<phone.length())
				encpass=encpass+phone.charAt(i);
			else
				j[1]=1;
			if(i<pass.length())
				encpass=encpass+pass.charAt(i);
			else
				j[2]=1;
			if(j[0]==1 && j[1]==1 && j[2]==1)
				break;
			i++;
		}
	}
	public String getEncpass()
	{
		return encpass;
	}
	public boolean equals(String s)
	{
		boolean b;
		if(s.equals(encpass))
			b=true;
		else
			b=false;
		return b;
	}
	@Override
	public String toString() {
		return "Password [email=" + email + ", phone=" + phone + ", pass=" + pass + ", encpass=" + encpass + "]";
	}
	
	
}
