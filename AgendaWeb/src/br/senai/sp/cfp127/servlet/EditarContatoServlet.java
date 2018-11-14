package br.senai.sp.cfp127.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.cfp127.model.Usuario;


@WebServlet("/EditarContatoServlet")
public class EditarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EditarContatoServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Usuario usuario = new Usuario();
	
	}

}
