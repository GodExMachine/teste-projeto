package modelo.entidade.evento;

import java.time.LocalDate;

public class Evento {
	private Long id;
	private Long idUsuario;
	private Long idEndereco;
	private LocalDate dataEvento;
	private String comentario;

	public Evento() {
	}

	public Evento(Long id, Long idUsuario, Long idEndereco, LocalDate dataEvento, String comentario) {
		this.id = id;
		this.idUsuario = idUsuario;
		this.idEndereco = idEndereco;
		this.dataEvento = dataEvento;
		this.comentario = comentario;
	}

	public Evento(Long idUsuario, Long idEndereco, LocalDate dataEvento, String comentario) {
		this(null, idUsuario, idEndereco, dataEvento, comentario);
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Long getIdEndereco() {
		return idEndereco;
	}

	public void setIdEndereco(Long idEndereco) {
		this.idEndereco = idEndereco;
	}

	public LocalDate getDataEvento() {
		return dataEvento;
	}

	public void setDataEvento(LocalDate dataEvento) {
		this.dataEvento = dataEvento;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
}
