package org.ccs.cyperweb.service;

import java.util.List;

import org.ccs.cyperweb.model.Profile;

import smartcrud.common.orm.Page;
import smartcrud.common.orm.PropertyFilter;

public interface ProfileService {
	public List<Profile> findAllProfiles();
	
	public void createProfile(Profile p);
	
	public void updateProfile(Profile o);
	
	public void deleteProfile(Long id);
	
	public Profile findProfileById(Long id);

	public Page<Profile> findByPage(Page<Profile> page, List<PropertyFilter> filters);

}
