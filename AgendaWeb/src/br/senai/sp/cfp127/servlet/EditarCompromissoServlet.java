package br.senai.sp.cfp127.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.senai.sp.cfp127.dao.CompromissoDao;
import br.senai.sp.cfp127.model.Compromisso;
import br.senai.sp.cfp127.model.Usuario;

/**
 * Servlet implementation class EditarCompromissoServlet
 */
@WebServlet("/EditarCompromissoServlet")
public class EditarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditarCompromissoServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int codCompromisso = Integer.parseInt(request.getParameter("cod_compromisso"));
		
		Compromisso compromisso = new Compromisso();
		
		
		compromisso.setTitulo(request.getParameter("txt-titulo"));
		compromisso.setData(request.getParameter("txt-data"));
		compromisso.setHoraInicio(request.getParameter("txt-horaInicio"));
		compromisso.setHoraFim(request.getParameter("txt-horaFim"));
		compromisso.setPrioridade(request.getParameter("txt-prioridade"));
		compromisso.setStatus(request.getParameter("txt-status"));
		compromisso.setDescricao(request.getParameter("txt-descricao"));
		compromisso.setCodCompromisso(codCompromisso);
		
		
		
		CompromissoDao dao = new CompromissoDao();
		dao.setCompromisso(compromisso);
		
		
		if(dao.atualizar(compromisso)) {
			HttpSession sessao = request.getSession();
			sessao.setAttribute("compromisso", compromisso);
			response.sendRedirect("compromissos.jsp");
		}else {
			response.sendRedirect("#");
		}
	}

}
