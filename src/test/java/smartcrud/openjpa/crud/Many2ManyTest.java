package smartcrud.openjpa.crud;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.model.Project;
import org.ccs.cyperweb.service.ProjectService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class Many2ManyTest {
	private static final Log logger = LogFactory.getLog(Many2ManyTest.class);
	@Autowired
	private ProjectService projectService;

	@Test
	public void testQuery1() {
		Project ps = projectService.findProjectById(1L);
	}

}
