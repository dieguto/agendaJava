package br.senai.sp.cfp127.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.cfp127.dao.ContatoDao;

/**
 * Servlet implementation class ExcluirCompromissoServlet
 */
@WebServlet("/ExcluirCompromissoServlet")
public class ExcluirCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ExcluirCompromissoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int codCompromisso = Integer.parseInt(request.getParameter("cod_compromisso"));
		ContatoDao dao = new ContatoDao();
		
		if(dao.deletar(codCompromisso)) {
			response.sendRedirect("compromissos.jsp");
		}else {
			
		}
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
