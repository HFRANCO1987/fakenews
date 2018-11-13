<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/login.css" rel="stylesheet">

<link rel="stylesheet"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />

<style>
</style>


<title>Monitoramento FakeNews - Acesso Restrito</title>
</head>
<body>
	<form class="form-signin" action="/autenticar" method="post" commandName="usuario">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">Acesso Restrito</h1>
		</div>

		<div class="form-group">
			<input type="email" name="email" class="form-control" required
				autofocus
				placeholder="Email"> 
		</div>

		<div class="form-group">
			<input type="password" name="senha" class="form-control"
				required
				placeholder="Senha"> 
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
	</form>

	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>


</body>
</html>