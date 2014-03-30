package smartcrud.openjpa.crud;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.model.ParkingSpace;
import org.ccs.cyperweb.service.ParkingSpaceService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class BiDirectioinalOne2OneTest {
	private static final Log logger = LogFactory.getLog(BiDirectioinalOne2OneTest.class);
	@Autowired
	private ParkingSpaceService parkingSpaceService;

	@Test
	public void testQuery1() {
		ParkingSpace ps = parkingSpaceService.findParkingSpaceById(1L);
		logger.debug(ps.getEmployee().getName());
	}

}
