<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="br.senai.sp.cfp127.model.Usuario" %>
	<%@ page import="br.senai.sp.cfp127.model.Compromisso" %>
	<% 
	
	Usuario usuario = new Usuario();
	usuario = (Usuario) session.getAttribute("usuario");
	
	Compromisso compromisso = new Compromisso();
	compromisso = (Compromisso) session.getAttribute("compromisso");
	session.removeAttribute("compromisso");
	
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
					<form id="usuario" action="EditarCompromissoServlet" method="get">
					
					
					<div class="card-body">
					
						<div class="alert-warning">
						<ul id="mensagens-erro">
						</ul>
					</div>
						<div class="row">
							<div class="col-md-12 text-primary">
								<h6 class="text-primary mb-4">Dados do seu compromisso:</h6>
							</div>
							
						</div>
						<div class="row form-group">
							
							<div class="col-md-8">
								<input type="text" name="cod_compromisso" id="cod_compromisso" hidden="hidden" value="<%= compromisso.getCodCompromisso() %>"  > 
								<label for="txt-titulo" >Titulo</label>
								<input class="form-control" type="text" name="txt-titulo" id="txt-titulo" value="<%= compromisso.getTitulo() %>" placeholder="Ex:Mercado, Pizzaria, Aniversario da afilhada">
							</div>
							<div class="col-md-4">
								<label for="txt-data">Data:</label>
								<input class="form-control" type="date" name="txt-data" id="txt-data" value="<%= compromisso.getData() %>">
							</div>
							
				
						</div>
						<div class="row form-group">
							<div class="col-md-3">
								<label for="txt-horaInicio">horaInicio:</label>
								<input class="form-control" type="time" name="txt-horaInicio" id="txt-horaInicio" value="<%= compromisso.getHoraInicio() %>" >
							</div>
							<div class="col-md-3">
								<label for="txt-horaFim">horaFim:</label>
								<input class="form-control" type="time" name="txt-horaFim" id="txt-horaFim" value="<%= compromisso.getHoraFim() %>">
							</div>
							<div class="col-md-2">
								<label for="txt-prioridade">Prioridade:</label>
								<select class="form-control" name="txt-prioridade" id="txt-prioridade" value="<%= compromisso.getPrioridade() %>" >
									
									<% 
										if(Integer.parseInt(compromisso.getPrioridade()) == 0){ 
										%>
										<option value="0" selected>
											Alta
										</option>
										<option value="1">
											Média
										</option>
										<option value="2">
											Baixa
										</option>
									<%}else if(Integer.parseInt(compromisso.getPrioridade()) == 1){ 
										%>
										<option value="0">
											Alta
										</option>
										<option value="1" selected>
											Média
										</option>
										<option value="2">
											Baixa
										</option> 
									
									<%}else if(Integer.parseInt(compromisso.getPrioridade()) == 2){ 
										%>
										<option value="0">
											Alta
										</option>
										<option value="1">
											Média
										</option>
										<option value="2" selected>
											Baixa
										</option> 
										
										
										<% } %>
									
								
								</select>
							</div>
							<div class="col-md-4">
								<label for="txt-status">Status:</label>
								<select class="form-control" name="txt-status" id="txt-status" value="<%= compromisso.getStatus() %>" >
									<!-- Fazer os Status e Deletar  -->
									
									<option value="0">
										Em andamento
									</option>
									<option value="1">
										Cancelado
									</option>
									<option value="2">
										Concluido
									</option>
									
								</select>
								
							</div>
							
							
				
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<label for="txt-descricao">Descrição:</label>
								<textarea class="form-control h-75" name="txt-descricao" id="txt-descricao" ><%= compromisso.getDescricao() %> </textarea>
							</div>
							
						</div>
					</div>
					
					<div class="card-footer">
						<button class="btn btn-success" id="bt-Atualizar">Atualizar Compromisso</button>
						<a href="compromissos.jsp" class="btn btn-danger">Cancelar</a>
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
	
