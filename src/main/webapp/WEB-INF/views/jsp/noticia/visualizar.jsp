<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />


<title>Monitoramento FakeNews - Visualizar Notícia</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="/">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<c:if test="${usuario.id > 0}">
				<li class="nav-item"><a class="nav-link" href="/usuario/pesquisa">Usuários</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/noticia/pesquisa">Notícias</a></li>
			</c:if>
		</ul>
	</div>
	<input type="hidden" value="${usuario.id}">
  <c:if test="${usuario.id > 0}">
  	<span class="badge badge-danger">${usuario.nome} | ${usuario.email}</span>
  </c:if>
  
  <ul class="navbar-nav px-3">
  		<c:if test="${usuario.id > 0}">
			<li class="nav-item text-nowrap">
				<a class="nav-link" href="/logout">
				Logout
				</a>
			</li>
  		</c:if>
  		<c:if test="${usuario.id == null}">
			<li class="nav-item text-nowrap"><a class="nav-link" href="/login">Login</a></li>
  		</c:if>
	</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">Notícia</h1>
			</div>
			<div>
				<form action="/noticia/comentario" method="post"
					commandName="comentario">
					<input type="hidden" name="idNoticia" value="${noticia.id}">
					<div class="card border-secondary mb-12">

						<div class="card-header" style="font-weight: bold">
							<a href="${noticia.link}" target="blank_">${noticia.titulo}</a> <span
								style="text-align: right; width: 100%; display: flex; direction: rtl">
								<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
									value="${noticia.data}" /> - ${noticia.usuario.nome}
							</span>
						</div>

						<div class="card-body text-primary">
							<p class="card-text">${fn:substring(noticia.texto,0, 500)}</p>
						</div>

						<div class="card-footer">
							<c:if test="${usuario.id > 0}">
								<div class="row">
									<div class="col-md-12" style="display: flex">
										<textarea cols="4" name="descricao"></textarea>
										<button type="submit" class="btn btn-primary"
											style="align-self: center; margin-left: 5px; width: 5%;">Enviar</button>
									</div>
									<div class="col-md-1 pt-2">
										<a href="#" class="badge badge-info">Comentários
											(${noticia.listaComentarios.size()})</a>
									</div>
								</div>
							</c:if>
							<ul class="list-group mt-2">
								<c:forEach var="comentario" items="${noticia.listaComentarios}">
									<li class="list-group-item">
									
									<c:if test="${comentario.usuario.id == noticia.usuario.id }">
										<span class="badge badge-primary">${comentario.usuario.nome} - 
										<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
												value="${comentario.data}" /></span> 
									</c:if>
									
									<c:if test="${comentario.usuario.id != noticia.usuario.id }">
										<span class="badge badge-warning">${comentario.usuario.nome} - 
										<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
													value="${comentario.data}" /></span> 
									</c:if>
									
									
									<br/> ${comentario.descricao}</li>
								</c:forEach>
							</ul>
						</div>
					</div>

				</form>
			</div>
			</main>
		</div>
	</div>

	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<script>
		$('textarea').each(
				function() {
					this.setAttribute('style', 'height:' + (this.scrollHeight)
							+ 'px;overflow-y:hidden;');
					this.setAttribute('style', 'width:95%');
				}).on('input', function() {
			this.style.height = 'auto';
			this.style.height = (this.scrollHeight) + 'px';
		});
	</script>


</body>
</html>