package com.cognizant.dao;

import java.util.List;

import javax.persistence.EntityManager;

import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cognizant.entity.UserDetails;

@Component
public class UserDetailsDAO {

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public void addUser(UserDetails u) {
		em.persist(u);

	}
	public UserDetails getUserDetails(long l) {
		// TODO Auto-generated method stub
		
		
		UserDetails retrive = em.find(UserDetails.class, l);
		/*if(retrive==null)
		{
		flag=true;
		}
		else
			flag=false;
	*/
		return retrive;
	}
	
	
	
	/*public boolean checkUserLogin(String accNo){
		Long acc=Long.parseLong(accNo);
		boolean flag=false;
		
		UserDetails retrive = em.find(UserDetails.class, acc);
		Query query=em.createQuery("select accountNumber from UserDetails");
		List<Long> list=query.getResultList();
		System.out.println("outer loop " +list);
for( int i=0;i<list.size();i++)
		{
			System.out.println("Inner loop "+list);
			
		
		if(retrive==null)
			{
			flag=true;
			}
			else
				flag=false;
		return flag;
		
		}
*/
}
