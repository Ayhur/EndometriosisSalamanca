package daos;

import java.util.List;

import modelos.ComunidadesAutonomas;

public interface ComunidadesAutonomasDAO {
	
	/**
	 * Método que se encarga de listar las comunidades en función del pais.<br>
	 * @param pais
	 * @return
	 */
	List <ComunidadesAutonomas> listarComunidades(int pais);
}
