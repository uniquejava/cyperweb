package org.ccs.cyperweb.service;

import org.ccs.cyperweb.dao.ProjectDao;
import org.ccs.cyperweb.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProjectService {
	@Autowired
	private ProjectDao projectDao;

	@Transactional
	public void saveProject(Project ps) {
		projectDao.saveProject(ps);
	}

	@Transactional
	public void updateProject(Project ps) {
		projectDao.updateProject(ps);
	}

	@Transactional
	public void removeProject(Long id) {
		Project ps = projectDao.findProjectById(id);
		if (ps != null) {
			projectDao.removeProject(ps);
		}
	}

	@Transactional
	public void batchRemove(String name) {
		projectDao.batchRemove(name);
	}

	public Project findProjectById(Long id) {
		Project prj = projectDao.findProjectById(id);
		return prj;
	}

}
