package org.ccs.cyperweb.dao;

import java.util.List;

import org.ccs.cyperweb.model.Profile;

import smartcrud.common.orm.Page;
import smartcrud.common.orm.PropertyFilter;

public interface ProfileDao {
	public List<Profile> findAllProfiles();

	public void createProfile(Profile p);

	public void updateProfile(Profile o);
	
	public void deleteProfile(Long id);

	public void deleteProfiles(String ids);
	
	public Profile findProfileById(Long id);
	
	public Page<Profile> findByPage(Page<Profile> page, List<PropertyFilter> filters);



}
