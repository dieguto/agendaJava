<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="br.senai.sp.cfp127.model.Usuario" %>
	<%@ page import="br.senai.sp.cfp127.model.Contato" %>
	<% 
	
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	Contato contato = new Contato();
	contato = (Contato) session.getAttribute("contato");
	
	if(usuario == null){
		response.sendRedirect("Login.html");
	}else{
		%>
		<!DOCTYPE html>
<html>
<head>

<title>Criar novo usuario</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<meta charset="UTF-8">
</head>
<body class="bg-dark">
	<div class="bg-info text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-1">
					<img src="./imagens/agenda64.png">
				</div>
				<div class="col-md-11">
					<h1>Agenda Eletrônica</h1>
					<h6>Contatos e Compromissos</h6>
				</div>
			</div>
		</div>
	</div>
	<div class="container mt-5 fluid">

		<div class="row">
			<div class="col-md-4">
				<%@ include file = "painel-usuario.jsp" %>
				<%@ include file = "menu.html" %>
			</div>

			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-info text-white">
						<h5><img src="imagens/edituser48.png"> Alterar dados do Contato</h5>
					</div>
					<form id="usuario" action="CadastrarContatoServlet" method="post">
					
					
					<div class="card-body">
						<div class="alert-warning">
						<ul id="mensagens-erro">
						</ul>
					</div>
						<div class="row">
							<div class="col-md-12 text-primary">
								<h6 class="text-primary mb-4">Dados do seu contato:</h6>
							</div>
						</div>
						<div class="row form-group">
							
							<div class="col-md-6">
								<input type="text" name="txt-cod" hidden="hidden" value="<%= contato.getCodContato()%>"> 
								<label for="txt-nome">Nome:</label>
								<input class="form-control" type="text" name="txt-nome" id="txt-nome" value="<%= contato.getNome() %>" placeholder="Digite seu nome">
							</div>
							<div class="col-md-6">
								<label for="txt-email">E-mail</label>
								<input class="form-control" type="text" name="txt-email" id="txt-email" value="<%= contato.getEmail() %>" placeholder="Ex:Batman@gmail.com">
							</div>
							
						</div>
						<div class="row form-group">
							
							<div class="col-md-6">
								<label for="senha">Telefone:</label>
								<input class="form-control" type="text" name="txt-telefone" id="txt-telefone" value="<%= contato.getTelefone() %>" placeholder="Ex: (11)4002-8922">
							</div>
							<div class="col-md-6">
								<label for="conf-senha">Endereço:</label>
								<input class="form-control" type="text" name="txt-endereco" id="txt-endereco" value="<%= contato.getEndereco() %>" placeholder="Ex: Rua sem saída, 666,SP">
							</div>
						</div>
					</div>
					
					<div class="card-footer">
						<button class="btn btn-success" id="bt-Cadastrar">Atualizar Contato</button>
						<a href="contatos.jsp" class="btn btn-danger">Cancelar</a>
					</div>
					</form>
				</div>
			</div>
		</div>


	</div>

</body>
</html>
		<% 
	}
	
	%> 
	
