package org.ccs.cyperweb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.ccs.cyperweb.model.Profile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDaoImpl implements ProfileDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Profile> findAllProfiles() {
		return jdbcTemplate.query("select * from profile",
				new RowMapper<Profile>() {
					public Profile mapRow(ResultSet rs, int rowNum) throws SQLException {
						Profile p = new Profile();
						p.setId(rs.getLong("id"));
						p.setName(rs.getString("name"));
						return p;
					}

				});
	}

	public void createProfile(Profile p) {
		jdbcTemplate.update("insert into profile(name) values (?)",new Object[] { p.getName() });
	}

	public void deleteProfile(Long id) {
		jdbcTemplate.update("delete from profile where id=?", id);
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
