<%@page import="java.util.ArrayList"%>
<%@page import="br.senai.sp.cfp127.dao.CompromissoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="br.senai.sp.cfp127.model.Usuario" %>
	<%@ page import="br.senai.sp.cfp127.model.Compromisso" %>
	<%@ page import="br.senai.sp.cfp127.util.FormataData" %>
	<% 
	
	int status = 0;
	
	if (request.getParameter("txt-status") != null){
		status = Integer.parseInt(request.getParameter("txt-status"));
	}
	
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	CompromissoDao dao = new CompromissoDao();
	ArrayList<Compromisso> compromisso = new ArrayList<>();
	
	compromisso = dao.getCompromissos(usuario.getCod(), status);
	
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
						<div class="row form-group">
							<div class="col-md-4">
								<label for="status">Status:</label>
								<select class="form-control" name="txt-status" id="txt-status" onchange="myscript()">
									<option value="0" <%= status == 0 ? "selected" : "" %>>
										Em andamento
									</option>
									<option value="1" <%= status == 1 ? "selected" : "" %>>
										Cancelado
									</option>
									<option value="2" <%= status == 2 ? "selected" : "" %>>
										Concluido
									</option>
									
								</select>
								
								
							</div>
						</div>
						<table class="table table-hover table-dark">
						
							<thead>
								<tr>
									<th scope="col">Cód.</th>
									<th scope="col">Compromisso</th>
									<th scope="col">Data</th>															
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<% for (Compromisso c : compromisso){ %>
							
							
								<tr>
									<td><%= c.getCodCompromisso()%></td>
									<td><a href="ExibirCompromissoServlet?cod_compromisso=<%= c.getCodCompromisso()%>"><%= c.getTitulo()%></a></td>
									<td><%= FormataData.dataPt(c.getData()) %></td>
									<td>
										<a href="ExcluirCompromissoServlet?cod_compromisso=<%= c.getCodCompromisso()%>"><img src="imagens/confirm24.png">
										</a>
									</td>
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
	<script> 
		function myscript(){
		    
		    var status = document.querySelector("#txt-status");
		    
		    if (status.value == 0){
		        window.location.href="compromissos.jsp?txt-status=0";
		    }
		    
		    if (status.value == 1){
		        window.location.href="compromissos.jsp?txt-status=1";
		    }
		    
		    if (status.value == 2){
		        window.location.href="compromissos.jsp?txt-status=2";
		    }
		}
		
	</script>
</body>
</html>
		<% 
	}
	%> 
	
