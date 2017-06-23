 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<body ng-app="myApp">
	<div ng-controller="myCntrl">
<form:form method="GET" action="mvc/viewHomeLoan2">


<table>

<tr>
				<td>Account Number :</td>
				<td><form:input path="AccountNumber" placeholder="AccountNumber" ng-pattern="/^[0-9\b.\b]{1,10}$/" ng-model="AccountNumber" required="true"/></td>
				<td><form:errors path="AccountNumber" cssClass="error" /></td>
				<td><span ng-show="ApplyHomeLoan.AccountNumber.$error.required && !ApplyHomeLoan.AccountNumber.$pristine">Account Number is required</span></td>
      <td> <span ng-show="ApplyHomeLoan.AccountNumber.$error.pattern && !ApplyHomeLoan.AccountNumber.$pristine">Only Numbers are required</span></td>
			</tr>

			<tr>
				<td>Loan Account Number :</td>
				<td><form:input path="loanAccountNumber" placeholder="loanAccountNumber" ng-pattern="/^[0-9\b.\b]{1,10}$/" ng-model="loanAccountNumber" required="true"/></td>
				<td><form:errors path="loanAccountNumber" cssClass="error" /></td>
				<td><span ng-show="ApplyHomeLoan.loanAccountNumber.$error.required && !ApplyHomeLoan.loanAccountNumber.$pristine">Loan Account Number is required</span></td>
      <td> <span ng-show="ApplyHomeLoan.loanAccountNumber.$error.pattern && !ApplyHomeLoan.loanAccountNumber.$pristine">Only Numbers are required</span></td>
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