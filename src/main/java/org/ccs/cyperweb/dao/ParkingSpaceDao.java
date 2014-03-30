package org.ccs.cyperweb.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ccs.cyperweb.model.ParkingSpace;
import org.springframework.stereotype.Repository;

@Repository
public class ParkingSpaceDao {
	@PersistenceContext
	private EntityManager em;

	public void saveParkingSpace(ParkingSpace parkingSpace) {
		em.persist(parkingSpace);
	}

	public void updateParkingSpace(ParkingSpace parkingSpace) {
		em.merge(parkingSpace);
	}

	public void removeParkingSpace(ParkingSpace parkingSpace) {
		em.remove(parkingSpace);
	}

	public void batchRemove(String parkingSpacename) {
		em.createQuery("DELETE FROM ParkingSpace u  WHERE u.name = ?1").setParameter(1, parkingSpacename).executeUpdate();
	}

	public ParkingSpace findParkingSpaceById(Long id) {
		ParkingSpace parkingSpace = em.find(ParkingSpace.class, id);
		return parkingSpace;
	}

	public ParkingSpace getReference(Long id) {
		ParkingSpace parkingSpace = em.getReference(ParkingSpace.class, id);
		return parkingSpace;
	}

}
