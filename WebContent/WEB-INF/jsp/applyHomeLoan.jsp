<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<title>Apply home Loan</title>
</head>
<body>
	
	<body ng-app="myApp">
	<div ng-controller="myCntrl">
	
	
	<form:form method="POST"
		commandName="/BaseCodeSlice_BankManagementSystem/mvc/applyHomeLoan"
		modelAttribute="homeLoan" name="ApplyHomeLoan">
		
		<td><button>
<a href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/home.jsp?AccNo=${msg}">Home</a>
					</button></td>
		
		<table>

			<tr>
				<td>Loan Amount :</td>
				<td><form:input path="loanAmount" placeholder="loanAmount" ng-pattern="/^[0-9\b.\b]{1,10}$/" ng-model="loanAmount" required="true"/></td>
				<td><form:errors path="loanAmount" cssClass="error" /></td>
				<td><span ng-show="ApplyHomeLoan.loanAmount.$error.required && !ApplyHomeLoan.loanAmount.$pristine">Loan Amount is required</span></td>
      <td> <span ng-show="ApplyHomeLoan.loanAmount.$error.pattern && !ApplyHomeLoan.loanAmount.$pristine">Only Numbers are required</span></td>
			</tr>
			
			<tr>
			<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/dd/MM"); %>
				<td>Loan Apply Date :</td>
				<td><form:input path="loanApplyDate"  value="<%= df.format(new java.util.Date())%>"  type="hidden"/><%= df.format(new java.util.Date())%>	</td>
				<td><form:errors path="loanApplyDate" cssClass="error" /></td>
			</tr>
			
			<tr>
				<td>Duration of the loan :</td>
				<td><form:select path="loanDuration">
						<option value="5">5</option>
						<option value="10">10</option>
					</form:select></td>
				<td><form:errors path="loanDuration" cssClass="error" /></td>
			</tr>
			
			<tr>
				<td>Annual Income :</td>
				<td><form:input path="annualIncome" placeholder="annualIncome" ng-model="annualIncome" ng-pattern="/^[0-9\b.\b]{1,10}$/" required="true"/></td>
			<form:errors path="annualIncome" cssClass="error" /></td>
				
				<td><span ng-show="ApplyHomeLoan.annualIncome.$error.required && !ApplyHomeLoan.annualIncome.$pristine">Annual Income is required</span></td>
         <td><span ng-show="ApplyHomeLoan.annualIncome.$error.pattern && !ApplyHomeLoan.annualIncome.$pristine">Only Numbers are required</span></td>
			
			</tr>
			
			<tr>
				<td>Company Name :</td>
				<td><form:input path="companyName" placeholder="CompanyName" ng-pattern="/^[A-Za-z\b \b]{1,30}$/"  ng-model="companyName"  required="true" /></td>
				<td><form:errors path="companyName" cssClass="error" /></td>
			<td></body>	<span ng-show="ApplyHomeLoan.companyName.$error.required && !ApplyHomeLoan.companyName.$pristine">Company Name is required</span></td>
   <td> <span ng-show="ApplyHomeLoan.companyName.$error.pattern && !ApplyHomeLoan.companyName.$pristine">Company Name should be proper</span></td>
			</tr>
			
			<tr>
				<td>Designation :</td>
				<td><form:input path="designation" placeholder="Designation" ng-model="designation" ng-pattern="/^[A-Za-z\b \b]{1,30}$/"  required="true" /></td>
				<td><form:errors path="designation" cssClass="error" /></td>
				
				<td></body><span ng-show="ApplyHomeLoan.designation.$error.required && !ApplyHomeLoan.designation.$pristine">Designation is required</span></td>
       <td><span ng-show="ApplyHomeLoan.designation.$error.pattern && !ApplyHomeLoan.designation.$pristine">Designation should be proper</span></td>
			
			</tr>
			
			<tr>
				<td>Total Exp :</td>
				<td><form:input path="totalExperience" placeholder="TotalExperience" ng-model="totalExperience" ng-pattern="/^[0-9\b.\b]{1,10}$/" required="true"/></td>
				<td><form:errors path="totalExperience" cssClass="error" /></td>
				
				<td><span ng-show="ApplyHomeLoan.totalExperience.$error.required && !ApplyHomeLoan.totalExperience.$pristine">totalExperience is required</span></td>
        <td><span ng-show="ApplyHomeLoan.totalExperience.$error.pattern && !ApplyHomeLoan.totalExperience.$pristine">totalExperience should number</span></td>
			
			</tr>
			
			<tr>
				<td>Exp with Current company :</td>
				<td><form:input path="currentExperience" placeholder="CurrentExperience" ng-model="currentExperience" ng-pattern="/^[0-9\b.\b]{1,10}$/" required="true"/></td>
				<td><form:errors path="currentExperience" cssClass="error" /></td>
				
				
				<td><span ng-show="ApplyHomeLoan.currentExperience.$error.required && !ApplyHomeLoan.currentExperience.$pristine">Current Experience is required</span></td>
      <td> <span ng-show="ApplyHomeLoan.currentExperience.$error.pattern && !ApplyHomeLoan.currentExperience.$pristine">Current Experience should number</span></td>
			
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