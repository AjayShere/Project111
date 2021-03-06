package com.cognizant.controller;

import java.util.Iterator;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.entity.HomeLoan;
import com.cognizant.exception.BankManagementException;
import com.cognizant.service.ApplyHomeLoanService;

@Controller
public class ApplyHomeLoanController {
	private static final Logger LOG = Logger.getLogger(ApplyHomeLoanController.class);

	@Autowired
	ApplyHomeLoanService applyHomeLoanService;
	boolean flag = true;

	@RequestMapping(value = "/applyHomeLoan", method = RequestMethod.GET)
	public String getHOmeLoan(Model model, @RequestParam("AccNo") String AccNo,
			@RequestParam("AccName") String AccName) {
		model.addAttribute("msg", AccNo);
		model.addAttribute("name", AccName);

		model.addAttribute("homeLoan", new HomeLoan());
		return "applyHomeLoan";
	}

	@RequestMapping(value = "/applyHomeLoan", method = RequestMethod.POST)
	public String initiateHomeLoan(@ModelAttribute("homeLoan") @Valid HomeLoan homeLoan, BindingResult result,
			Model model, @RequestParam("AccNo") String msg) {
		long accountNumber = Long.parseLong(msg);
		long loanAccNum = applyHomeLoanService.generateLoanAccNumber();
		String id = applyHomeLoanService.generateRandomNumber(accountNumber);
		homeLoan.setLoanAccountNumber(loanAccNum);
		homeLoan.setHomeLoanId(id);
		LOG.info(homeLoan);

		System.out.println(msg);
		System.out.println(accountNumber);

		try {
			applyHomeLoanService.updateHomeLoanDetails(accountNumber, homeLoan);
		} catch (ConstraintViolationException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
			Iterator<ConstraintViolation<?>> iterator = constraintViolations.iterator();
			while (iterator.hasNext()) {
				ConstraintViolation<?> next = iterator.next();
				LOG.info("Validation message: " + next.getMessage());
				LOG.info("Invalid field: " + next.getPropertyPath());
				LOG.info("Validation class/bean: " + next.getRootBean());
				// result.reject(next.getPropertyPath(), next.getMessage());
				result.rejectValue(next.getPropertyPath().toString(), "", next.getMessage());
				// result.rejectValue(arg0, arg1, arg2);
			}
		} catch (BankManagementException e) {
			e.printStackTrace();
			flag = false;
			LOG.error("Validation message: " + e.getMessage());
			String sb = e.getMessage();
			String sb1[] = sb.split(":");

			result.rejectValue(sb1[0], "", sb1[1]);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("m1", homeLoan.getLoanAccountNumber());
		model.addAttribute("m2", homeLoan.getHomeLoanId());
		model.addAttribute("msg", msg);

		if (result.hasErrors()) {
			return "applyHomeLoan";

		}

		else
			return "successHomeLoan";

	}
}
