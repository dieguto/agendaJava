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

@WebServlet("/EditarContatoServlet")
public class EditarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditarContatoServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Contato contato = new Contato();
		
		contato.setCodContato(Integer.parseInt(request.getParameter("txt-contato")));
		contato.setNome(request.getParameter("txt-nome"));
		contato.setEmail(request.getParameter("txt-email"));
		contato.setTelefone(request.getParameter("txt-telefone"));
		contato.setEndereco(request.getParameter("txt-endereco"));
		System.out.println(contato.getCodContato());
		ContatoDao dao = new ContatoDao();
		dao.setContato(contato);
		if(dao.atualizar(contato)) {
			response.sendRedirect("contatos.jsp");
		}else {
			response.sendRedirect("exibir_contato.jsp");
		} 
	}

}
