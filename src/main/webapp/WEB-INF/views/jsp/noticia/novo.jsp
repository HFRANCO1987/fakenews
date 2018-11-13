<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css" />

<title>Monitoramente FakeNews - Cadastro de Notícia</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Usuários</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/noticia/pesquisa">Notícias</a>
      </li>
    </ul>
  </div>
 <input type="hidden" value="${usuario.id}">
  <c:if test="${usuario.id > 0}">
  	<span class="badge badge-danger">${usuario.nome} | ${usuario.email}</span>
  </c:if>
  
  <ul class="navbar-nav px-3">
  		<c:if test="${usuario.id > 0}">
			<li class="nav-item text-nowrap">
				<a class="nav-link" href="#">
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
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
				<h1 class="h2">Cadastro de Notícia</h1>
			</div>
			<div>
				<form action="/noticia/salvar" method="post" commandName="noticia">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="titulo">Titulo</label> <input type="text"
								class="form-control" name="titulo" placeholder="Título">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="link">Link</label> <input type="text"
								class="form-control" name="link" placeholder="Link">
						</div>
						<div class="form-group col-md-6">
							<label for="inputGroupFile01">Definir imagem</label>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id=""
									inputGroupFile01"" aria-describedby="inputGroupFileAddon01">
								<label class="custom-file-label" for="inputGroupFile01">Escolha
									a Imagem</label>
							</div>
						</div>
					</div>

					<div class="form-row">
						<label for="editor">Texto</label>
						<div class="form-group col-md-12">
							<textarea name="texto" id="editor" >
							   Informe o texto da notícia
							</textarea>
						</div>
					</div>



					<div class="form-row">
						<div class="form-group col-md-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="isFake">
								<label class="form-check-label" for="gridCheck"> É
									FakeNews? </label>
							</div>
						</div>
						<div class="form-group col-md-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="isAprovado">
								<label class="form-check-label" for="gridCheck">
									Publicar? </label>
							</div>
						</div>

					</div>

					<button type="reset" class="btn btn-danger">Cancelar</button>
					<button type="submit" class="btn btn-primary">Gravar</button>
				</form>
			</div>
			</main>
		</div>
	</div>

	<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	
	<script
		src="https://cdn.ckeditor.com/ckeditor5/11.1.1/classic/ckeditor.js"></script>

	<script>
		ClassicEditor
	    .create( document.querySelector( '#editor' ) )
	    .then( editor => {
	        console.log( editor );
	    } )
	    .catch( error => {
	        console.error( error );
	    } );
	</script>
</body>
</html>