package daos;

import java.util.List;

import modelos.Pais;

public interface PaisesDAO {
	
	/**
	 * M�todo que trae una lista con todos los paises de la BBDD.<br>
	 * @return
	 */
	List<Pais>listarPaises();

}
