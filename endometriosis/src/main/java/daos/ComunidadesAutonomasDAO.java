package daos;

import java.util.List;

import modelos.ComunidadesAutonomas;

public interface ComunidadesAutonomasDAO {
	
	/**
	 * M�todo que se encarga de listar las comunidades en funci�n del pais.<br>
	 * @param pais
	 * @return
	 */
	List <ComunidadesAutonomas> listarComunidades(int pais);
}
