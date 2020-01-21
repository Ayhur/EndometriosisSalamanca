package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UsuariosDAO;
import daosImpl.UsuariosDAOImpl;
import modelos.Usuario;

@WebServlet("/ServletRegistroUsuario")
public class ServletRegistroUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		boolean enc = false;
		String nombre = request.getParameter("campoNombre");
		String apellidos = request.getParameter("campoApellidos");
		String fechaNacimiento = request.getParameter("campoFechaNacimiento");
		String email = request.getParameter("campoEmail");
		String dni = request.getParameter("campoDNI");
		String usuario = request.getParameter("campoUsuario");
		String password = request.getParameter("campoPassword");
		String repPassword = request.getParameter("campoRepetirpassword");
		Integer pais = Integer.parseInt(request.getParameter("selectPais"));
		Integer municipio;
		if (null != request.getParameter("selectMunicipios")) {
			municipio = Integer.parseInt(request.getParameter("selectMunicipios"));
		} else {
			municipio = null;
		}
		
		Usuario newUser = new Usuario(nombre, apellidos, dni, email, usuario, repPassword, fechaNacimiento, municipio, pais);
		System.out.println("Esto es objeto usuario nuevo");
		System.out.println(newUser.toString());
		
		/* INICIO validaciones */
		
		// valido nombre
//		String expresionRegularnombre = "^([a-z ραινσϊη]{2,20})$/i";
		String expresionRegularnombre = "^([a-z ραινσϊη]{2,20})$";
		Pattern pattern = Pattern.compile(expresionRegularnombre);
		Matcher matcher = pattern.matcher(nombre);
		if (!matcher.matches()) {
			System.out.println("nombre no valido");
			request.setAttribute("mensajenombre", "Nombre no valido");
			enc = true;
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
//			return;
		}
		
		// valido apellidos//
		String expresionRegularapellidos = "^([a-z ραινσϊη]{2,50})$/i";
		Pattern pattern1 = Pattern.compile(expresionRegularapellidos);
		Matcher matcher1 = pattern1.matcher(apellidos);
		if (!matcher1.matches()) {
			System.out.println("apellidos no valido ");
			request.setAttribute("mensajeapellido", "apellidos no valido");
			enc = true;
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
//			return;
		}
		
		// validacion fecha nacimiento//
		String expresionRegulfechanacimiento = "\\d{2}-\\d{2}-\\d{4}";
		Pattern pattern2 = Pattern.compile(expresionRegulfechanacimiento);
		Matcher matcher2 = pattern2.matcher(fechaNacimiento);
		if (!matcher2.matches()) {
			System.out.println("fecha de nacimiento no es valida dd-mm-yyyy ");
			request.setAttribute("mensajefechanacimiento", "fecha de nacimiento no es valida");
			enc = true;
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
//			return;
		} 
		
		// validacion email//
		//la expresion deberia ser \b[\w\.-]+@[\w\.-]+\.\w{2,4}\b
		String expresionRegulemail = "\\b[\\w\\.-]+@[\\w\\.-]+\\.\\w{2,4}\\b";
//		String expresionRegulemail2 = "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
		Pattern pattern3 = Pattern.compile(expresionRegulemail);
		Matcher matcher3 = pattern3.matcher(email);
		if (!matcher3.matches()) {
			System.out.println("el email no es valido ");
			request.setAttribute("mensajeemail", "el email no es valida");
			enc = true;
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
//			return;
		}
		
		// validacion DNI//
		//falta hacer

		// validacion usuario//
		String expresionRegulusuario = "[a-z0-9]{3,15}/i";
		Pattern pattern5 = Pattern.compile(expresionRegulusuario);
		Matcher matcher5 = pattern5.matcher(usuario);
		if (!matcher5.matches()) {
			System.out.println("el usuario no es valido ");
			request.setAttribute("mensajeusuario", "el usuario no es valida");
			enc = true;
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
//			return;
		}
		
		 // longitud de password//
		String expresionRegulpassword = "[a-z0-9]{8,20}/i";
		Pattern pattern6 = Pattern.compile(expresionRegulpassword);
		Matcher matcher6 = pattern6.matcher(password);
		if (!matcher6.matches()) {
			System.out.println("la password no tiene lo caracteres necesarios ");
			request.setAttribute("mensajepassword", "La password tiene que tener entre 8 y 20 caracteres");
			request.getRequestDispatcher("registro2.jsp").forward(request, response);
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
			return;
		}
		
		// Reutilizo el patron de password para repPassword
		matcher6 = pattern6.matcher(repPassword);
		// validacion concordancia password//
		if (!password.equals(repPassword) && matcher6.matches()) {
			System.out.println("la password no coincide");
			request.setAttribute("mensajeconconrdancia", "la password no concuerda");
			enc = true;
//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
//			return;
		}

		/* Fin validaciones */

		/** Transformacion de fecha nacimiento */
		
		  SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd"); 
		  Date fn = null; 
		  try { 
			  fn = formatoDelTexto.parse(fechaNacimiento); 
		  } catch (ParseException ex) {
			  System.out.println("Error al transformar la fecha de nacimiento");
			  ex.printStackTrace(); 
		  }
		 
		/** Fin transformacion fecha */

		Usuario usuarios = new Usuario(nombre, apellidos, dni, email, usuario, password, fn.toString(),
				municipio, pais);
//		Usuario usuarios = new Usuario(nombre, apellidos, dni, email, usuario, password, fechaNacimiento,
//				municipio, pais);
		
		
		if(enc) {
			request.setAttribute("dataUserReg", usuarios);
			request.getRequestDispatcher("registro2.jsp").forward(request, response);
			//			request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
		}
		else {
			UsuariosDAO daoUsuario = new UsuariosDAOImpl();
			daoUsuario.registrarUsuario(usuarios);
			System.out.println("usuario registrado con exito");

			request.getRequestDispatcher("registroUsuarioOK.jsp").forward(request, response);
		}
		
		
		

	}
	
	
	
	//para numeros de telefono a nivel global
//	\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}/g

}