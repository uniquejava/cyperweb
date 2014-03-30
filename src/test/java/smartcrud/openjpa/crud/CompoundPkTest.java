package smartcrud.openjpa.crud;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.model.Ee;
import org.ccs.cyperweb.model.EeId;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class CompoundPkTest {
	private static final Log logger = LogFactory.getLog(NativeSqlTest.class);

	@PersistenceContext
	EntityManager em;

	@Test
	public void test() {
		EeId id = new EeId();
		id.setCty("111");
		id.setSn("123456");
		
		Ee ee= em.find(Ee.class, id);
		logger.info("sn-->" + ee.getSn());
		logger.info("salary-->" + ee.getSalary());
		
	}
}
