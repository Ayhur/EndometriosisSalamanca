 	package servletsAdmin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.PaisesDAO;
import daos.PreguntasDAO;
import daosImpl.PaisesDAOImpl;
import daosImpl.PreguntasDAOImpl;
import modelos.Preguntas;

@WebServlet("/ServletCargaDeDatosPreviaParaBusquedaPregunta")
public class ServletCargaDeDatosPreviaParaBusquedaPregunta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Llamamos a PreguntasDAO para traer de BBDD todas las preguntas del formulario 
		// y cargarlos para la dependencia de creación de nuevas preguntas
		PreguntasDAO preguntasDAO = new PreguntasDAOImpl();
		List<Preguntas> preguntaAcotadas = new ArrayList<Preguntas>();
		// Recorremos todas las preguntas del listado y las acortamos a max 48 caracteres
		for (Preguntas pregunta : preguntasDAO.obtenerPreguntas()) {
			String cadenaTemporal = String.valueOf(pregunta.getOrden()).concat(". ").concat(pregunta.getDescripcion());
			if (pregunta.getDescripcion().toCharArray().length > 48) {
				cadenaTemporal = cadenaTemporal.substring(0, 48).concat("...");
			}
			pregunta.setDescripcion(cadenaTemporal);
			preguntaAcotadas.add(pregunta);
		}

//		 Instanciamos la implementacion de paises para extraer un listado de los
//		 mismos y lo enviamos al jsp de registro para rellenar el campo selector Pais
		 
		PaisesDAO daoPaises = new PaisesDAOImpl();
		request.setAttribute("paises", daoPaises.listarPaises());
		request.setAttribute("preguntas", preguntaAcotadas);
		request.getRequestDispatcher("estadisticasInfo.jsp").forward(request, response);

	}

}
