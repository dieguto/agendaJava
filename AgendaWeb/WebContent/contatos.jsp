<%@page import="java.util.ArrayList"%>
<%@page import="br.senai.sp.cfp127.dao.ContatoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="br.senai.sp.cfp127.model.Usuario" %>
	<%@ page import="br.senai.sp.cfp127.model.Contato" %>
	<% 
	
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	ContatoDao dao = new ContatoDao();
	ArrayList<Contato> contatos = new ArrayList<>();
	
	contatos = dao.getContatos(usuario.getCod());
	
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
						<div class="row">
							<div class="col-md-9"><h5>Meus Contatos</h5></div>
							<div class="col-md-3"><a href="NovoContato.jsp" class="text-white btn">Novo Contato</a></div>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover table-dark">
						
							<thead>
								<tr>
									<th scope="col">Cód.</th>
									<th scope="col">Nome</th>
									<th scope="col">Email</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<% for (Contato c : contatos){ %>
							
							
								<tr>
									<td><%= c.getCodContato()%></td>
									<td><a href="ExibirContatoServlet&cod_contato=<%= c.getCodContato()%>"><%= c.getNome()%></a></td>
									<td><%= c.getEmail()%></td>
									<td>
										<a href="ExcluirContatoServlet&cod_contato=<%= c.getCodContato()%>"><img src="imagens/trash24.png">
										</a>
									</td>
								</tr>
								
								<% } %>
							</tbody>
						</table>
					</div>

					<div class="card-footer"></div>

				</div>
			</div>
		</div>


	</div>

</body>
</html>
		<% 
	}
	%> 
	
