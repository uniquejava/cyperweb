package org.ccs.cyperweb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ccs.cyperweb.model.Profile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import smartcrud.common.orm.Page;
import smartcrud.common.orm.PropertyFilter;
import smartcrud.common.orm.jdbc.Sql;

@Repository
public class ProfileDaoImpl implements ProfileDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Profile> findAllProfiles() {
		return jdbcTemplate.query("select * from profile", new RowMapper<Profile>() {
			public Profile mapRow(ResultSet rs, int rowNum) throws SQLException {
				Profile p = new Profile();
				p.setId(rs.getLong("id"));
				p.setName(rs.getString("name"));
				return p;
			}

		});
	}

	public void createProfile(Profile p) {
		jdbcTemplate.update("insert into profile(name) values (?)", new Object[] { p.getName() });
	}

	public void updateProfile(Profile o) {
		jdbcTemplate.update("update profile p set p.name=? where p.id=? ", new Object[] {o.getName(),o.getId() });
	}
	
	public void deleteProfile(Long id) {
		jdbcTemplate.update("delete from profile where id=?", id);
	}
	
	public void deleteProfiles(String ids) {
		String[] idArr = ids.split(",");
		List<Object[]>  params = new ArrayList<Object[]>();
		for (int i = 0; i < idArr.length; i++) {
			params.add(new Object[]{Long.valueOf(idArr[i])});
		}
		
		jdbcTemplate.batchUpdate("delete from profile where id=?", params);
	}
	

	public Profile findProfileById(Long id) {
		return jdbcTemplate.queryForObject("select * from profile p where p.id=?", new RowMapper<Profile>(){
			public Profile mapRow(ResultSet rs, int rowNum) throws SQLException {
				Profile p = new Profile();
				p.setId(rs.getLong("ID"));
				p.setName(rs.getString("NAME"));
				return p;
			}
		},new Object[]{id});
	}
	
	public int count(Page<Profile> page, final List<PropertyFilter> filters) {
		Sql sql = new Sql("select count(*) from profile where 1=1 ", page, filters);
		sql.build4count();
		return jdbcTemplate.queryForObject(sql.getSqlBody(), sql.getSqlParams(),Integer.class);
	}

	public Page<Profile> findByPage(Page<Profile> page, List<PropertyFilter> filters) {
		if (page.isAutoCount()) {
			int totalCount = count(page, filters);
			page.setTotalCount(totalCount);
		}

		Sql sql = new Sql("select * from profile where 1=1 ", page, filters);
		sql.build();

		List<Profile> content = jdbcTemplate.query(sql.getSqlBody(), new RowMapper<Profile>() {
			public Profile mapRow(ResultSet rs, int rowNum) throws SQLException {
				Profile o = new Profile();
				o.setId(rs.getLong("ID"));
				o.setName(rs.getString("NAME"));
				return o;
			}
		}, sql.getSqlParams());

		page.setContent(content);
		return page;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
