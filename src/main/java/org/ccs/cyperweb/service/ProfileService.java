package org.ccs.cyperweb.service;

import java.util.List;

import org.ccs.cyperweb.model.Profile;

public interface ProfileService {
	public List<Profile> findAllProfiles();
	
	public void createProfile(Profile p);
	
	public void deleteProfile(Long id);
}
