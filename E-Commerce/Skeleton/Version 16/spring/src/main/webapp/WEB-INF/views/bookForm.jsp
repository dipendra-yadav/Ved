<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/admin/book/addBook" var="url"></c:url>
	<form:form method="post" action="${url}" commandName="bookFormObj"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:label path="isbn"></form:label></td>
				<td><form:hidden path="isbn" /></td>
			</tr>
			<tr>
				<td><form:label path="title">TITLE</form:label></td>
				<td><form:input path="title"></form:input> <form:errors
						path="title"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="publisher">PUBLICATION</form:label></td>
				<td><form:input path="publisher"></form:input> <form:errors
						path="publisher"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="price">PRICE</form:label></td>
				<td><form:input path="price"></form:input> <form:errors
						path="price"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="author">AUTHOR</form:label></td>
				<td><form:input path="author"></form:input> <form:errors
						path="author"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="category">CATEGORY</form:label></td>
				<td><form:radiobutton path="category.cId" value="1" />New
					Arrivals <form:radiobutton path="category.cId" value="2" />Special
					Edition <form:radiobutton path="category.cId" value="3" />Discount
					Sale <form:radiobutton path="category.cId" value="4" />General</td>
			</tr>

			<tr>

				<td><form:input path="bookImage" type="file" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Book"></td>
			</tr>


		</table>
	</form:form>
</body>
</html>