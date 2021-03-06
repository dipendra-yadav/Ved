<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ include file="header.jsp"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>


<body>

	<div data-ng-app="myapp">
		<div data-ng-controller="bookController" data-ng-init="getAllBooks()">

			Search: <input type="text" data-ng-model="searchCondition">

			<h1>List of Books</h1>

			<table border="1" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Image</th>
						<th>ISBN</th>
						<th>TITLE</th>
						<th>CATEGORY NAME</th>
						<th>View/edit/delete</th>
					</tr>
				</thead>
				<tbody>
					<tr data-ng-repeat="b in books | filter:searchCondition">
						<c:url value="resources/images/{{b.isbn}}.png" var="src" />
						<td><img src="${src }" style="width: 30%" align="middle" /></td>
						<td>{{b.isbn}}</td>
						<td>{{b.title}}</td>
						<td>{{b.category.categoryName}}</td>


						<td><a href="getBookByIsbn/{{b.isbn}}"><span
								class="glyphicon glyphicon-info-sign"></span></a> <security:authorize
								access="hasRole('ROLE_ADMIN')">

								<a href="admin/delete/{{b.isbn}}"><span
									class="glyphicon glyphicon-trash"></span></a>
								<a href="admin/book/editBook/{{b.isbn}}"><span
									class="glyphicon glyphicon-edit"></span></a>

							</security:authorize></td>
					</tr>

				</tbody>
			</table>

		</div>
	</div>


<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
	var myapp = angular.module("myapp", []).controller(
			"bookController",
			function($scope, $http) {

				$scope.getAllBooks = function() {

					$http.get('http://localhost:9090/spring/getBooksList')
							.success(function(data) {
								$scope.books = data;
							})

				}

				$scope.addToCart = function(isbn) {
					$http.put(
							'http://localhost:8080/welcomehelloworld/cart/add/'
									+ isbn).success(function() {
						alert('Book Added Successfully');
					})
				}

			});
</script>

</body>

</html>