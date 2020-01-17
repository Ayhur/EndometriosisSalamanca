package daos;

import java.util.List;

import modelos.BarrasDiagrama;

public interface EstadisticasDAO {
	
	/**
	 * Método sin descripción.<br>
	 * @param id
	 * @return
	 */
	int clasificarPregunta(int id);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	List<String> valoresDeRespuesta (int id);
	
	/**
	 * 
	 * @param id
	 * @param valoresDistintosDeRespuesta
	 * @return
	 */
	int cantidadDeRepuestasEspecificasEnUnaPregunta( int id, String valoresDistintosDeRespuesta );
	
	/**
	 * 
	 * @param parseInt
	 * @return
	 */
	List<BarrasDiagrama> obtenerValoresDiagramaBarras(int parseInt);
	
	/**
	 * 
	 * @param NColumnas
	 * @return
	 */
	String [] valoresAleatoriosColor (int NColumnas);

}
