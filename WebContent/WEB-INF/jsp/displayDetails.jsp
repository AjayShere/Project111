<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body ng-app="myApp">
	<div ng-controller="EmpCtrl">






<table>
			<tr>
				<th>Homeloan Account Number</th>
				<th>Home Loan Id</th>
				<th>Loan Amount</th>
				<th>Loan Duration</th>
				<th>Apply Date</th>
				<th>Annual Income</th>
				<th>Company Name</th>
				<th>Designation</th>
				<th>Total Experience</th>
				<th>Current Experience</th>
			</tr>
			<tr ng-repeat="homeLoan in homeLoans">
				<td>{{homeLoan.loanAccountNumber}}</td>
				<td>{{homeLoan.homeLoanId}}</td>
				<td>{{homeLoan.loanAmount}}</td>
				<td>{{homeLoan.loanDuration}}</td>
				<td>{{homeLoan.loanApplyDate}}</td>
				<td>{{homeLoan.annualIncome}}</td>
				<td>{{homeLoan.companyName}}</td>
				<td>{{homeLoan.designation}}</td>
				<td>{{homeLoan.totalExperience}}</td>
				<td>{{homeLoan.currentExperience}}</td>
			</tr>
		</table>
		
		<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
        var app = angular.module('myApp', []);
        app.controller('EmpCtrl', function($scope, $http){
            $http({
              method: 'GET',
              url: 'http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/viewHomeLoan2?AccNo=${msg}'
            }).then(res=>res.data)
            .then(data => {
            	console.log(data);
            	$scope.HomeLoans = data;
            })
        
           
        })
    </script>
</body>
</html>