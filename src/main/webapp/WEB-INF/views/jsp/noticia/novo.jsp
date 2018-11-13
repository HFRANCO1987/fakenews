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
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Monitoramente
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
				<h1 class="h2">Cadastro de Notícia</h1>
			</div>
			<div>
				<form action="${s:mvcUrl("NC#salvar").build()}" method="post" commandName="noticia">
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