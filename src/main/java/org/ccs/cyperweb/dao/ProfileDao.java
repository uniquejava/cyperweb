package org.ccs.cyperweb.dao;

import java.util.List;

import org.ccs.cyperweb.model.Profile;

public interface ProfileDao {
	public List<Profile> findAllProfiles();

	public void createProfile(Profile p);

	public void deleteProfile(Long id);
}
