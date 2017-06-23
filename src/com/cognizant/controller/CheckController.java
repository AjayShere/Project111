package com.cognizant.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cognizant.dao.ApplyHomeLoanDao;
import com.cognizant.dao.ViewHomeLoanDao;
import com.cognizant.entity.HomeLoan;

@Controller
public class CheckController {
	
	
	@Autowired
	ViewHomeLoanDao dao;
	private List<HomeLoan> HomeLoan = new ArrayList<HomeLoan>();

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String getHOmeLoan() {
		
		return "check";
	}
	@RequestMapping(value = "/viewHomeLoan2", method = RequestMethod.GET)
	public String getHOmeLoan(Model model, @RequestParam("AccountNumber") String AccNo,
			@RequestParam("loanAccountNumber") String LoanAccNo) {
		model.addAttribute("msg", AccNo);
		model.addAttribute("loanAccountNumber", LoanAccNo);

		model.addAttribute("homeLoan", new HomeLoan());
		return "displayDetails";
	}
	

	@RequestMapping(value = "/viewHomeLoan2", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<HomeLoan> gethomeLoan(@RequestParam("loanAccountNumber") String LoanAccNo) {
		long loanAccountNumber = Long.parseLong(LoanAccNo);
		//System.out.println(msg);
		//System.out.println(accountNumber);
		
		HomeLoan=dao.CheckHomeDetails(loanAccountNumber);
		/*homeLoans = viewHomeLoanService.retrieveHomeDetails(accountNumber);

		LOG.info("in control");

		LOG.info(homeLoans);*/

		return HomeLoan;

	}

	
	
}
