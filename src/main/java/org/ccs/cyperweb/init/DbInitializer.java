package org.ccs.cyperweb.init;

import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * It's hard for us to create tables on cloud.
 * 
 * @author cyper.yin
 * 
 */
@Repository
public class DbInitializer {

	private static final Log logger = LogFactory.getLog(DbInitializer.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void init() throws IOException {
		int count = 0;

		try {
			count = jdbcTemplate.queryForObject("select count(1) from profile",
					Integer.class);

		} catch (Exception e) {
			logger.warn(e.getMessage());
		}

		if (count == 0) {
			logger.warn("profile does not exist or not intialized.");

			ClassPathResource cr = new ClassPathResource("init-db.sql");
			String sql = FileUtils.readFileToString(cr.getFile(), "UTF-8")
					.trim();
			if (sql.endsWith(";")) {
				sql = sql.substring(0, sql.length() - 1);
			}
			logger.info(sql);

			String[] sqls = sql.split(";");
			jdbcTemplate.batchUpdate(sqls);

		} else {

			logger.info("db's been initialized already.");
		}
	}
}
