package org.ccs.cyperweb.service;

import org.ccs.cyperweb.dao.ParkingSpaceDao;
import org.ccs.cyperweb.model.ParkingSpace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ParkingSpaceService {
	@Autowired
	private ParkingSpaceDao parkingSpaceDao;

	@Transactional
	public void saveParkingSpace(ParkingSpace ps) {
		parkingSpaceDao.saveParkingSpace(ps);
	}

	@Transactional
	public void updateParkingSpace(ParkingSpace ps) {
		parkingSpaceDao.updateParkingSpace(ps);
	}

	@Transactional
	public void removeParkingSpace(Long id) {
		ParkingSpace ps = parkingSpaceDao.findParkingSpaceById(id);
		if (ps != null) {
			parkingSpaceDao.removeParkingSpace(ps);
		}
	}

	@Transactional
	public void batchRemove(String name) {
		parkingSpaceDao.batchRemove(name);
	}

	public ParkingSpace findParkingSpaceById(Long id) {
		return parkingSpaceDao.findParkingSpaceById(id);

	}

}
