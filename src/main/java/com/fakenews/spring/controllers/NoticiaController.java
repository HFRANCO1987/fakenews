package com.fakenews.spring.controllers;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.compress.utils.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fakenews.spring.controllers.session.UsuarioSessao;
import com.fakenews.spring.model.Comentario;
import com.fakenews.spring.model.Noticia;
import com.fakenews.spring.service.NoticiaService;

@Controller
public class NoticiaController {

	@Autowired
	private NoticiaService noticiaService;
	
	@Autowired
	private UsuarioSessao usuarioSessao;

	@GetMapping(value = "/")
	public ModelAndView index() {
		Map<String, Object> model = new HashMap<>();
		model.put("noticias", noticiaService.findAll());
		model.put("usuario", usuarioSessao.getUsuario());
		return new ModelAndView("/index", model);
	}

	@PostMapping(value = "/noticia/salvar")
	public String salvar(@RequestParam("file") MultipartFile file, Noticia noticia, RedirectAttributes redirectAttributes) {
		try {
			byte[] encodeBase64 = Base64Utils.encode(IOUtils.toByteArray(file.getInputStream()));
			String base64Encoded = new String(encodeBase64, "UTF-8");
			noticia.setImagem(base64Encoded);
			noticia.setUsuario(usuarioSessao.getUsuario());
			noticiaService.saveOrUpdate(noticia);
			redirectAttributes.addFlashAttribute("sucesso", "Notícia gravada com sucesso!");
			return "redirect:/noticia/pesquisa";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping(value = "/noticia/pesquisa")
	public ModelAndView pesquisa() {
		Map<String, Object> model = new HashMap<>();
		model.put("noticias", noticiaService.findAll());
		model.put("usuario", usuarioSessao.getUsuario());
		return new ModelAndView("/noticia/pesquisa", model);
	}

	@GetMapping(value = "/noticia/novo")
	public ModelAndView novo(Noticia noticia) {
		Map<String, Object> model = new HashMap<>();
		model.put("usuario", usuarioSessao.getUsuario());
		return new ModelAndView("/noticia/novo", model);
	}

	@GetMapping(value = "/noticia/{id}")
	public ModelAndView novo(@PathVariable("id") Long id, Comentario comentario) {
		Map<String, Object> model = new HashMap<>();
		model.put("noticia", noticiaService.findById(id));
		model.put("usuario", usuarioSessao.getUsuario());
		return new ModelAndView("/noticia/visualizar", model);
	}

	@PostMapping(value = "/noticia/comentario")
	public ModelAndView salvarComentario(Comentario comentario) {
		try {
			Noticia noticia = noticiaService.findById(comentario.getIdNoticia());
			comentario.setNoticia(noticia);
			comentario.setUsuario(usuarioSessao.getUsuario());
			noticia.getListaComentarios().add(comentario);
			noticiaService.saveOrUpdate(noticia);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/noticia/" + comentario.getIdNoticia());
	}

}
