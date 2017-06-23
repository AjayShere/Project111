<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body ng-app="myApp">

	<div ng-controller="EmpCtrl">



		<h2 align="center">Welcome</h2>
		<h3>

<td>
			<hr />
			<table>
			<tr ">
					<th>S.NO</th>
					<th>Account Number</th>
					<th>Account Type</th>
					<th>Account Holder Name</th>
					<th>Account Balance</th>

				</tr>
				<tr ng-repeat="user in List | filter: search">
					<td>{{$index + 1}}</td>
					<td>{{user.accountNumber}}</td>
					<td>{{user.accountType}}</td>
					<td>{{user.acountHolderName}}</td>
					<td>{{user.accountBalance}}</td>

				</tr>
			</table>

		</h3>
	</div>
	
		<table class="table">
			<tr>
				<td><button>
						<a
							href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/addTransaction?AccNo=${msg}&AccName=${name}">Perform
							Transaction</a>
					</button></td>
			
					<td>
				<button>
						<a
							href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/getTransaction?AccNo=${msg}&AccName=${name}">View
							Transaction</a>
					</button></td></tr>
			<tr>
				<td><button>
						<a
							href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/insertEducationLoan?AccNo=${msg}&AccName=${name}">Apply
							Education Loan</a>
					</button></td>
				<td><button>
						<a
							href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/viewEducationLoanDetails?AccNo=${msg}&AccName=${name}">View
							Education Loan</a>
					</button></td>
			</tr>

			<tr>
				<td><button>
					<a
						href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/applyHomeLoan?AccNo=${msg}&AccName=${name}">Apply
						Home Loan</a>
				</button></td>
				<td><button>
					<a
						href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/viewHomeLoan?AccNo=${msg}&AccName=${name}">View
						Home Loan</a>
				</button></td>
				<button>
				<a
					href="http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/view?AccNo=${msg}">check</a>
			</button></td>
			</tr>
		</table>
	

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
        var app = angular.module('myApp', []);
        app.controller('EmpCtrl', function($scope, $http){
            $http({
              method: 'GET',
              url: 'http://localhost:8086/BaseCodeSlice_BankManagementSystem/mvc/homepage?AccNo=${msg}'
            	  
            }).then(res=>res.data)
            .then(data => {
            	console.log(data);
           $scope.List = data;
            })
         })
    </script>

</body>
</html>