<%@page import="java.util.ArrayList"%>
<%@page import="br.senai.sp.cfp127.dao.CompromissoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="br.senai.sp.cfp127.model.Usuario" %>
	<%@ page import="br.senai.sp.cfp127.model.Compromisso" %>
	<% 
	
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	CompromissoDao dao = new CompromissoDao();
	ArrayList<Compromisso> compromisso = new ArrayList<>();
	
	compromisso = dao.getCompromissos(usuario.getCod());
	
	if(usuario == null){
		response.sendRedirect("Login.html");
	}else{
		%>
		<!DOCTYPE html>
<html>
<head>

<title>Criar novo compromisso</title>

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
							<div class="col-md-9"><h5>Meus Compromissos</h5></div>
							<div class="col-md-3"><a href="novoCompromisso.jsp" class="text-white btn">Novo Compromisso</a></div>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover table-dark">
						
							<thead>
								<tr>
									<th scope="col">Cód.</th>
									<th scope="col">Compromisso</th>
									<th scope="col">Data</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<% for (Compromisso c : compromisso){ %>
							
							
								<tr>
									<td><%= c.getCodCompromisso()%></td>
									<td><a href="ExibirCompromissoServlet?cod_compromisso=<%= c.getCodCompromisso()%>"><%= c.getTitulo()%></a></td>
									<td><%= c.getData()%></td>
									<td>
										<a href="ExcluirCompromissoServlet?cod_compromisso=<%= c.getCodCompromisso()%>"><img src="imagens/trash24.png">
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
	
