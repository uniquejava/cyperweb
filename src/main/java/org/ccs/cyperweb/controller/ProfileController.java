package org.ccs.cyperweb.controller;

import javax.servlet.http.HttpServletRequest;

import org.ccs.cyperweb.model.Profile;
import org.ccs.cyperweb.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@RequestMapping(value = "")
	public String index(Model model) {
		model.addAttribute("profiles", profileService.findAllProfiles());
		return "profile/profile_index";
	}
	
	@RequestMapping(value = "create", method=RequestMethod.POST)
	public String create(HttpServletRequest request) {
		String name = request.getParameter("name");
		profileService.createProfile(new Profile(name));
		return "redirect:/profile";
	}
	
	@RequestMapping(value = "delete/{id}")
	public String delete(Model model, @PathVariable("id") Long id) {
		profileService.deleteProfile(id);
		
		return "redirect:/profile";
	}
	
}
