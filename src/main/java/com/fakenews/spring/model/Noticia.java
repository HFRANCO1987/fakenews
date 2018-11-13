package com.fakenews.spring.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "tab_noticia")
public class Noticia implements Serializable {

	private static final long serialVersionUID = -8441446254022782591L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@Column(name = "titulo")
	@NotNull(message="Titulo é um campo obrigatório!")
	private String titulo;

	@Column(name = "imagem")
	private byte[] imagem;

	@Column(name = "texto")
	@NotNull(message="Texto é um campo obrigatório!")
	private String texto;

	@Column(name = "link")
	@NotNull(message="Link é um campo obrigatório!")
	private String link;

	@Column(name = "fake")
	private Boolean isFake = Boolean.FALSE;

	@Column(name = "aprovado")
	private Boolean isAprovado = Boolean.FALSE;

	@OneToMany(mappedBy = "noticia", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
	private List<Comentario> listaComentarios = new ArrayList<>();

	@Column(name = "data")
	private Date data = new Date();

	@ManyToOne
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;

	public Noticia() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public byte[] getImagem() {
		return imagem;
	}

	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Boolean getIsFake() {
		return isFake;
	}

	public void setIsFake(Boolean isFake) {
		this.isFake = isFake;
	}

	public Boolean getIsAprovado() {
		return isAprovado;
	}

	public void setIsAprovado(Boolean isAprovado) {
		this.isAprovado = isAprovado;
	}

	public List<Comentario> getListaComentarios() {
		return listaComentarios;
	}

	public void setListaComentarios(List<Comentario> listaComentarios) {
		this.listaComentarios = listaComentarios;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Noticia other = (Noticia) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
