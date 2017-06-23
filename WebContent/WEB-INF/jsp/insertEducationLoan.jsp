<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<title>Apply Education Loan</title>
</head>
<body ng-app="myApp">
	<div ng-controller="myCntrl">
	
	<h2>Welcome: ${name}</h2>
	
	<form:form method="POST"
		commandName="/BaseCodeSlice_BankManagementSystem/mvc/insertEducationLoan"
		modelAttribute="educationLoan" name="applyEducationLoan">
		
		<td><button>
<a href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/home.jsp?AccNo=${msg}">Home</a>
					</button></td>
		<table>



			<tr>
				<td>Loan Amount</td>
				<td><form:input path="eduLoanAmount" placeholder="LoanAmount" ng-model="eduLoanAmount"  ng-pattern="/^[0-9\b.\b]{1,10}$/" required="true"/></td>
				<form:errors path="eduLoanAmount" cssClass="error" /></td>
				<td><span ng-show="applyEducationLoan.eduLoanAmount.$error.required && !applyEducationLoan.eduLoanAmount.$pristine">Loan Amount is required</span>
        <span ng-show="applyEducationLoan.eduLoanAmount.$error.pattern && !applyEducationLoan.eduLoanAmount.$pristine">Only Numbers are required</span></td>
				
			</tr>

			<tr>
				<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/dd/MM"); %>
				<td>Loan Apply Date :</td>
				<td><form:input path="loanApplyDate"  value="<%= df.format(new java.util.Date())%>"  type="hidden"/><%= df.format(new java.util.Date())%>	</td>
				<td><form:errors path="loanApplyDate" cssClass="error" /></td>
			</tr>

			<tr>
				<td>Loan Duration</td>
				<td><form:select path="eduLoanDuration">
						<option value="5">5</option>
						<option value="10">10</option>
					</form:select></td>
				<td><form:errors path="eduLoanDuration" cssClass="error" /></td>
			</tr>

			<tr>
				<td>Course name</td>
				<td><form:input path="courseName" placeholder="CourseName" ng-model="courseName" ng-pattern="/^[A-Za-z\b \b]{1,100}$/" required="true" /></td>
				<form:errors path="courseName" cssClass="error" /></td>
				<td><span ng-show="applyEducationLoan.courseName.$error.required && !applyEducationLoan.courseName.$pristine">Course name is required</span>
        <span ng-show="applyEducationLoan.courseName.$error.pattern && !applyEducationLoan.courseName.$pristine">Only Alphabets are required</span></td>
			</tr>

			<tr>
				<td>Course Fee</td>
				<td><form:input path="courseFee" placeholder="CourseFee" ng-model="courseFee"  ng-pattern="/^[0-9\b.\b]{1,10}$/" required="true"/></td>
				<form:errors path="courseFee" cssClass="error" /></td>
				<td><span ng-show="applyEducationLoan.courseFee.$error.required && !applyEducationLoan.courseFee.$pristine">Course Fee is required</span>
        <span ng-show="applyEducationLoan.courseFee.$error.pattern && !applyEducationLoan.courseFee.$pristine">Numeric Entry required</span></td>
			</tr>

			<tr>
				<td>Father Name</td>
				<td><form:input path="fatherName" placeholder="Fathername" ng-model="fatherName"  ng-pattern="/^[A-Za-z\b \b]{1,100}$/" required="true"/></td>
				<form:errors path="fatherName" cssClass="error" /></td>
				<td><span ng-show="applyEducationLoan.fatherName.$error.required && !applyEducationLoan.fatherName.$pristine">Father name is required</span>
        <span ng-show="applyEducationLoan.fatherName.$error.pattern && !applyEducationLoan.fatherName.$pristine">Only Alphabets are required</span></td>
			</tr>

			<tr>
				<td>ID Number</td>
				<td><form:input path="idCardNumber"  placeholder="IdNumber" ng-model="idCardNumber"  ng-pattern="/^[0-9]{1,10}$/" required="true"/></td>
				<form:errors path="idCardNumber" cssClass="error" /></td>
				<td><span ng-show="applyEducationLoan.idCardNumber.$error.required && !applyEducationLoan.idCardNumber.$pristine">ID Number is required</span>
        <span ng-show="applyEducationLoan.idCardNumber.$error.pattern && !applyEducationLoan.idCardNumber.$pristine">Numeric Entry required </span></td>
			</tr>
			
			<tr>
				<td>Father's Annual Income</td>
				<td><form:input path="fatherAnnualIncome" placeholder="Father'sAnnualIncome" ng-model="fatherAnnualIncome"  ng-pattern="/^[0-9\b.\b]{1,10}$/" required="true"/></td>
				<td><form:errors path="fatherAnnualIncome" cssClass="error" /></td>
				<td><span ng-show="applyEducationLoan.fatherAnnualIncome.$error.required && !applyEducationLoan.fatherAnnualIncome.$pristine">Father's Annual Income is required</span>
        <span ng-show="applyEducationLoan.fatherAnnualIncome.$error.pattern && !applyEducationLoan.fatherAnnualIncome.$pristine">Numeric Entry required</td>
			</tr>

			<tr>
				<td></td>
				<td colspan="2"><button type="submit" value="Add">Submit</button></td>
			</tr>
		</table>
	</form:form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script>
	var app = angular.module('myApp', []);
	
	app.controller('myCntrl', function($scope){
		
		
	})
</script>
</body>
</html>