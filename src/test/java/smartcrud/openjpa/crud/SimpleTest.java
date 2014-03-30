package smartcrud.openjpa.crud;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ccs.cyperweb.model.User;
import org.ccs.cyperweb.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class SimpleTest {
	private static final Log logger = LogFactory.getLog(SimpleTest.class);
	@Autowired
	private UserService userService;

	@Test
	public void testQuery1(){
		User user = userService.findUserById(1L);
	}
	@Test
	public void testQuery(){
		User user = userService.findUserById(1L);
		
		List<User> userList = userService.findUsersByName("single");
		Assert.isTrue(userList.size() > 0);
		for(User u: userList){
			logger.info(u.getId());
		}
		
		
		List<Long> idList = userService.findUsersByName2("single");
		for(Long u: idList){
			logger.info(u);
		}
		
		
		List<Object[]> objList = userService.findUsersByName3("single");
		for(Object[] obj: objList){
			for (int i = 0; i < obj.length; i++) {
				logger.debug(obj[i]);
			}
			
			logger.debug("----------------------");
		}
		
		
		userList = userService.findUsersByName4("single");
		for(User u: userList){
			logger.info(u.getId());
		}
	}
	@Test
	public void testSave() {
		User user = new User();
		user.setUsername("single2");
		user.setPassword("xxxxxx");
		userService.saveUser(user);
		
	}
	
	@Test
	public void testUpdate() {
		User user = userService.findUserById(4L);
		user.setPassword("zzz2");
		userService.updateUser(user);
	}
	
	
	@Test
	public void testRemove() {
		//userService.batchRemove("single");
		userService.removeUser(11L);
	}
	

}
