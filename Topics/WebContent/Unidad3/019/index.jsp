<%@page import="java.util.List"%>
<%@page import="Unidad3.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//En cada archivo que no es login/logout se debe validar la autenticacion.
	
	boolean valid = false;
	if(
		session.getAttribute("019_auth") != null &&
		session.getAttribute("019_auth").getClass().getSimpleName().equals("User")
	){
		User userSession = (User) session.getAttribute("019_auth");
		List<User> userList = Auth.readList("auth.csv");
		
		for(User user: userList){
			if(user.getName().equals(userSession.getName())){
				valid = true;
				break;
			}
		}
	}
	
	if(!valid) response.sendRedirect("login.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="swd">
<meta name="description" content="Haga un programa en Java JSP donde 
								usando POO: a) Exista un formulario web,
								b)Mediante sesiones se pueda guardar un
								borrador de la informacion que tipea el usuario
								previo a presionar el boton enviar
">
<title>Guardar borrador temporal del formulario</title>
</head>
<body>
	<form onsubmit="">
		<input type="text" id="userName" onkeyup="change(this);" placeholder="Escriba su nombre"><br>
		<input type="text" id="userAge" onkeyup="change(this);" placeholder="Escriba su edad"><br>
		<input type="text" id="userId" onkeyup="change(this);" placeholder="Escriba su identidad"><br>
		<textarea id="userDescription" onkeyup="change(this);" cols="60" rows="10"></textarea><br>
		<button type="submit" onclick="return writeData();">Enviar</button>
	</form>
	<script src="../../jquery.js"></script>
	<script src="scripts/script.js"></script>
</body>
</html>