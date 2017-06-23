<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perform Transaction</title>
</head>


<body ng-app="myApp">
	<div ng-controller="myCntrl">
		<h2>Welcome : ${name}</h2>



		<form:form method="POST"
			commandName="/BaseCodeSlice_BankManagementSystem/mvc/addTransaction?AccNo=${msg}"
			modelAttribute="transaction" name="TransactionForm">

			<td><button>
					<a
						href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/home.jsp?AccNo=${msg}">Home</a>
				</button></td>

			<table>

				<tr>
					<td>Transaction Description :</td>
					<td><form:input path="transactionDescription"
							placeholder="Transaction Description" maxlength="30"
							ng-model="transactionDescription" required="true"
							ng-pattern="/^[A-Za-z\b \b]{1,30}$/" /></td>
					<td><form:errors path="transactionDescription"
							cssClass="error" /></td>
					<td><span
						ng-show="TransactionForm.transactionDescription.$error.required && !TransactionForm.transactionDescription.$pristine">Transaction
							description is required</span></td>

					<td><span
						ng-show="TransactionForm.transactionDescription.$error.pattern && !TransactionForm.transactionDescription.$pristine">Only
							Alphabets are required</span></td>
				</tr>

				<tr>
					<td>Transaction Type :</td>
					<td><form:select path="transactionType">
							<option value="" disabled selected>Select account type</option>
							<option value="DEPOSIT">DEPOSIT</option>
							<option value="WITHDRAWAL">WITHDRAWAL</option>
						</form:select></td>
					<td><form:errors path="transactionType" cssClass="error" /></td>

				</tr>

				<tr>
					<td>Transaction Amount :</td>
					<td><form:input path="transactionAmount"
							placeholder="transactionAmount" maxlength="9"
							ng-pattern="/^[0-9\b.\b]{1,10}$/" ng-model="transactionAmount"
							required="true" /></td>
					<td><form:errors path="transactionAmount" cssClass="error" /></td>
					<td><span
						ng-show="TransactionForm.transactionAmount.$error.required && !TransactionForm.transactionAmount.$pristine">Transaction
							amount is required</span></td>
					<td><span
						ng-show="TransactionForm.transactionAmount.$error.pattern && !TransactionForm.transactionAmount.$pristine">Only
							Numbers are required</span></td>

				</tr>
				<tr>
					<td></td>
					<td colspan="2"><button type="submit" value="Add">Submit</button></td>
				</tr>
			</table>
		</form:form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);

		app.controller('myCntrl', function($scope) {
			$scope.transactionDescription = "";
			$scope.transactionAmount = "";
			$scope.transactionAmount = "";
		})
	</script>
</body>
</html>