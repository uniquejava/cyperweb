package org.ccs.cyperweb.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ccs.cyperweb.model.Project;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDao {
	@PersistenceContext
	private EntityManager em;

	public void saveProject(Project project) {
		em.persist(project);
	}

	public void updateProject(Project project) {
		em.merge(project);
	}

	public void removeProject(Project project) {
		em.remove(project);
	}

	public void batchRemove(String projectname) {
		em.createQuery("DELETE FROM Project u  WHERE u.name = ?1").setParameter(1, projectname).executeUpdate();
	}

	public Project findProjectById(Long id) {
		Project project = em.find(Project.class, id);
		return project;
	}

	public Project getReference(Long id) {
		Project project = em.getReference(Project.class, id);
		return project;
	}

}
