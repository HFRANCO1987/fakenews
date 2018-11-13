package com.fakenews.spring.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fakenews.spring.model.Comentario;
import com.fakenews.spring.model.Noticia;
import com.fakenews.spring.service.NoticiaService;

@Controller
public class NoticiaController {
	
	@Autowired
	private NoticiaService noticiaService;

	@GetMapping(value = "/")
	public ModelAndView index() {
		Map<String, Object> model = new HashMap<>();
		model.put("noticias", noticiaService.findAll());
		return new ModelAndView("/index", model);
	}
	
	@PostMapping(value = "/noticia/salvar")
	public String salvar(Noticia noticia, RedirectAttributes redirectAttributes) {
		try {
			noticiaService.saveOrUpdate(noticia);
			redirectAttributes.addFlashAttribute("sucesso", "Notícia gravada com sucesso!");
			return "redirect:pesquisa";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping(value = "/noticia/pesquisa")
	public ModelAndView pesquisa() {
		Map<String, Object> model = new HashMap<>();
		model.put("noticias", noticiaService.findAll());
		return new ModelAndView("/noticia/pesquisa", model);
	}

	@GetMapping(value = "/noticia/novo")
	public ModelAndView novo(Noticia noticia) {
		Map<String, Object> model = new HashMap<>();
		return new ModelAndView("/noticia/novo", model);
	}
	
	@GetMapping(value = "/noticia/{id}")
	public ModelAndView novo(@PathVariable("id") Long id, Comentario comentario) {
		Map<String, Object> model = new HashMap<>();
		model.put("noticia", noticiaService.findById(id));
		return new ModelAndView("/noticia/visualizar", model);
	}
	
	@PostMapping(value = "/noticia/comentario")
	public ModelAndView salvarComentario(Comentario comentario) {
		Map<String, Object> model = new HashMap<>();
		try {
			Noticia noticia = noticiaService.findById(comentario.getIdNoticia());
			comentario.setNoticia(noticia);
			noticia.getListaComentarios().add(comentario);
			noticiaService.saveOrUpdate(noticia);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/noticia/" + comentario.getIdNoticia());
	}
	
}
