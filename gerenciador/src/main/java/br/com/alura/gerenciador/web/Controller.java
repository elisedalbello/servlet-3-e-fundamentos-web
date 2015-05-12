package br.com.alura.gerenciador.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/executar")
public class Controller extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomeTarefa = request.getParameter("tarefa");
		if(nomeTarefa == null){
			throw new IllegalArgumentException("Você não passou uma tarefa");
		}
		
		String nomeDaClasse = "br.com.alura.gerenciador.web." + nomeTarefa;
		try {
			Class type = Class.forName(nomeDaClasse);
			Tarefa tarefa = (Tarefa) type.newInstance();
			String pagina = tarefa.executa(request, response);
			request.getRequestDispatcher(pagina).forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
