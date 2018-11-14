package br.senai.sp.cfp127.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.cfp127.dao.ContatoDao;
import br.senai.sp.cfp127.model.Contato;
import br.senai.sp.cfp127.model.Usuario;

/**
 * Servlet implementation class CadastrarContatoServlet
 */
@WebServlet("/CadastrarContatoServlet")
public class CadastrarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CadastrarContatoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		
		usuario = (Usuario) request.getSession().getAttribute("usuario");
		
		Contato contato = new Contato();
		contato.setNome(request.getParameter("txt-nome"));
		contato.setEmail(request.getParameter("txt-email"));
		contato.setTelefone(request.getParameter("txt-telefone"));
		contato.setEndereco(request.getParameter("txt-endereco"));
		contato.setUsuario(usuario);
		ContatoDao dao = new ContatoDao();
		
		if(dao.gravar(contato)) {
			response.sendRedirect("contatos.jsp");
		}else {
			response.sendRedirect("#");
		} 
	}

}
