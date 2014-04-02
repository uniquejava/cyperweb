package org.ccs.cyperweb.service;

import java.util.List;

import org.ccs.cyperweb.dao.ProfileDao;
import org.ccs.cyperweb.model.Profile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import smartcrud.common.orm.Page;
import smartcrud.common.orm.PropertyFilter;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;

	public List<Profile> findAllProfiles() {
		return profileDao.findAllProfiles();
	}
	
	@Transactional
	public void createProfile(Profile p) {
		profileDao.createProfile(p);
	}

	@Transactional
	public void deleteProfile(Long id) {
		profileDao.deleteProfile(id);
	}
	

	public Page<Profile> findByPage(Page<Profile> page, List<PropertyFilter> filters) {
		return profileDao.findByPage(page,filters);
	}

	public void setProfileDao(ProfileDao profileDao) {
		this.profileDao = profileDao;
	}

	

}
