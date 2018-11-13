<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />

<title>Monitoramente FakeNews - Listagem de Notícia</title>
</head>
<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Monitoramento
		FakeNews</a>
	<ul class="navbar-nav px-3">
		<li class="nav-item text-nowrap"><a class="nav-link" href="#">Login</a></li>
	</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active" href="#">
							<span data-feather="home"></span> Usuários <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file"></span> Listar
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="shopping-cart"></span> Novo
					</a></li>
				</ul>

				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>Noticias</span> <a
						class="d-flex align-items-center text-muted" href="#"> <span
						data-feather="plus-circle"></span>
					</a>
				</h6>
				<ul class="nav flex-column mb-2">
					<li class="nav-item"><a class="nav-link"
						href="/noticia/pesquisa"> <span data-feather="file-text"></span>
							Listar
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/noticia/novo">
							<span data-feather="file-text"></span> Novo
					</a></li>
				</ul>
			</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">Listagem de Notícias</h1>
			</div>
			<div>
				<form>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col" style="width: 40px">Código</th>
								<th scope="col">Titulo</th>
								<th scope="col">Resumo texto</th>
								<th scope="col" style="width: 80px">É Fake?</th>
								<th scope="col" style="width: 80px">Publicar?</th>
								<th scope="col" style="width: 180px">Operação</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticias}" var="noticia">
								<tr>
									<td>${noticia.id}</td>
									<td>${noticia.titulo}</td>
									<td>${fn:substring(noticia.texto,0, 150)}...</td>
									<td>${noticia.isFake ? 'Sim' : 'Não'}</td>
									<td>${noticia.isAprovado ? 'Sim' : 'Não'}</td>
									<td><a href="#">[EDITAR]</a> | <a href="#">[EXCLUIR]</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
					</nav>
				</form>
			</div>
			</main>
		</div>
	</div>

	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>