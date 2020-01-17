package modelos;

public class Preguntas {

	private int idpregunta;
	private String descripcion;
	private int tipo;
	private int nivel;
	private int orden;
	private boolean cajaAdicional;
	private int minSlider;
	private int maxSlider;
	private int bloque;

	public Preguntas() {
		this.nivel = 0;
		this.cajaAdicional = false;
	}

	public Preguntas(int idpregunta, String descripcion, int tipo) {
		super();
		this.idpregunta = idpregunta;
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.nivel = 0;
	}

	public Preguntas(String descripcion, int tipo, boolean cajaAdicional) {
		super();
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.nivel = 0;
		this.cajaAdicional = cajaAdicional;
	}

	public Preguntas(String descripcion, int tipo, int nivel) {
		super();
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.nivel = nivel;
	}

	public Preguntas(String descripcion, int tipo, int nivel, int orden, boolean cajaAdicional) {
		super();
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.orden = orden;
		this.nivel = nivel;
		this.cajaAdicional = cajaAdicional;

	}

	public Preguntas(String descripcion, int tipo, int nivel, int orden, boolean cajaAdicional, int bloquePregunta) {
		super();
		this.descripcion = descripcion;
		this.tipo = tipo;
		this.orden = orden;
		this.nivel = nivel;
		this.cajaAdicional = cajaAdicional;
		this.bloque = bloquePregunta;

	}
//	public Preguntas(String descripcion, int tipo, int idPregunta, int orden) {
//		super();
//		this.descripcion = descripcion;
//		this.tipo = tipo;
//		this.idpregunta = idPregunta;
//		this.orden = orden;
//		this.nivel = 0;
//		
//	}

	public int getIdpregunta() {
		return idpregunta;
	}

	public void setIdpregunta(int idpregunta) {
		this.idpregunta = idpregunta;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public boolean isCajaAdicional() {
		return cajaAdicional;
	}

	public void setCajaAdicional(boolean cajaAdicional) {
		this.cajaAdicional = cajaAdicional;
	}

	public int getMinSlider() {
		return minSlider;
	}

	public void setMinSlider(int minSlider) {
		this.minSlider = minSlider;
	}

	public int getMaxSlider() {
		return maxSlider;
	}

	public void setMaxSlider(int maxSlider) {
		this.maxSlider = maxSlider;
	}

	public int getBloque() {
		return bloque;
	}

	public void setBloque(int i) {
		this.bloque = i;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bloque;
		result = prime * result + (cajaAdicional ? 1231 : 1237);
		result = prime * result + ((descripcion == null) ? 0 : descripcion.hashCode());
		result = prime * result + idpregunta;
		result = prime * result + maxSlider;
		result = prime * result + minSlider;
		result = prime * result + nivel;
		result = prime * result + orden;
		result = prime * result + tipo;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Preguntas other = (Preguntas) obj;
		if (bloque != other.bloque)
			return false;
		if (cajaAdicional != other.cajaAdicional)
			return false;
		if (descripcion == null) {
			if (other.descripcion != null)
				return false;
		} else if (!descripcion.equals(other.descripcion))
			return false;
		if (idpregunta != other.idpregunta)
			return false;
		if (maxSlider != other.maxSlider)
			return false;
		if (minSlider != other.minSlider)
			return false;
		if (nivel != other.nivel)
			return false;
		if (orden != other.orden)
			return false;
		if (tipo != other.tipo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Preguntas [idpregunta=" + idpregunta + ", descripcion=" + descripcion + ", tipo=" + tipo + ", nivel="
				+ nivel + ", orden=" + orden + ", cajaAdicional=" + cajaAdicional + ", minSlider=" + minSlider
				+ ", maxSlider=" + maxSlider + ", bloque=" + bloque + "]";
	}

}
