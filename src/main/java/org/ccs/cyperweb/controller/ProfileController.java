package org.ccs.cyperweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ccs.cyperweb.model.Profile;
import org.ccs.cyperweb.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import smartcrud.common.orm.Page;
import smartcrud.common.orm.PropertyFilter;
import smartcrud.common.orm.jdbc.JdbcUtils;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@RequestMapping(value = "")
	public String index(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex, Model model,
			HttpServletRequest request) {

		List<PropertyFilter> filters = JdbcUtils.buildPropertyFilters(request);

		Page<Profile> page = new Page<Profile>(10);
		page.setPageIndex(pageIndex);
		page = profileService.findByPage(page, filters);

		model.addAttribute("page", page);
		return "profile/profile_index";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public void create(HttpServletRequest request, Model model) {
		try {
			String name = request.getParameter("name");
			profileService.createProfile(new Profile(name));
			model.addAttribute("ok", "true");
			model.addAttribute("msg", "create success!");
		} catch (Exception e) {
			model.addAttribute("ok", "false");
			model.addAttribute("msg", e.getMessage());
		}
	}
	
	@RequestMapping("update/{id}")
	public void update(Model model, @PathVariable("id") Long id) {
		Profile o = profileService.findProfileById(id);
		model.addAttribute("o", o);
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void update(Profile o, Model model) {
		try {
			profileService.updateProfile(o);
			model.addAttribute("ok", "true");
			model.addAttribute("msg", "update success!");
		} catch (Exception e) {
			model.addAttribute("ok", "false");
			model.addAttribute("msg", e.getMessage());
		}
	}
	
	
	@RequestMapping(value = "delete/{id}")
	public String delete(Model model, @PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		profileService.deleteProfile(id);
		redirectAttributes.addFlashAttribute("success", "delete success!");
		return "redirect:/profile";
	}

}
