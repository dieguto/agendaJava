<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="br.senai.sp.cfp127.model.Usuario" %>
	<%@ page import="br.senai.sp.cfp127.model.Compromisso" %>
	<%@ page import="br.senai.sp.cfp127.dao.CompromissoDao" %>
	<%@page import="br.senai.sp.cfp127.util.FormataData"%>
	<%@page import="java.util.ArrayList"%>
	<% 
	
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	CompromissoDao dao = new CompromissoDao();
	ArrayList<Compromisso> compromisso = new ArrayList<>();
	
	compromisso = dao.getCompromissoData(usuario.getCod());
	
	
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
			<div class="col-md-3">
				<%@ include file = "painel-usuario.jsp" %>
				<%@ include file = "menu.html" %>
			</div>

	
			<div class="col-md-9">
				<div class="card">
					<div class="card-header bg-info text-white">
						<h5>Bem-vindo</h5>
					</div>
					
					<% for (Compromisso c : compromisso){ %>
					<div class="card-deck" >
					
						<div class="card text-white bg-primary mb-3 mt-3 ml-4 mr-4" style="max-width: 15rem;">
  					<div class="card-header"><%= FormataData.dataPt(c.getData())  %></div>
  					<div class="card-body">
   					 <h5 class="card-title"><%= c.getTitulo() %></h5>
   					 <p class="card-text"><%= c.getDescricao() %></p>
  					</div>
					</div>
					
						
					<% } %>	
					<!-- <div class="card-footer"></div> -->
					</div>
				</div>
					
			</div>
		</div>


	</div>

</body>
</html>
		<% 
	}
	
	%> 
	
