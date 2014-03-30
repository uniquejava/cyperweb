package smartcrud.openjpa.crud;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.model.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class NativeSqlTest {
	private static final Log logger = LogFactory.getLog(NativeSqlTest.class);
	private static final String EMP_QUERY = "SELECT id as ID, name as Name, NULL as DEPT_ID from EMP LIMIT 1, 2";

	@PersistenceContext(unitName = "JPAPU")
	EntityManager em;
	

	@Test
	public void test() {
		List<Employee> result = em.createNativeQuery(EMP_QUERY, Employee.class).getResultList();

		for (Employee e : result) {
			logger.debug(e.getName());
		}
	}
}
