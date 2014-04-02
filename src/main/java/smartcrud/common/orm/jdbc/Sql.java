package smartcrud.common.orm.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import smartcrud.common.orm.Page;
import smartcrud.common.orm.PropertyFilter;
import smartcrud.common.orm.PropertyFilter.MatchType;


/**
 * 
 * @author cyper.yin
 * 
 */
public class Sql {
	private static Logger logger = Logger.getLogger(Sql.class);
	private Page page;
	private List<PropertyFilter> filters;
	private String sql;
	private StringBuffer sqlBody;
	private List<Object> sqlParams;

	public Sql(String sql, Page page, List<PropertyFilter> filters) {
		this.sql = sql;
		this.page = page;
		this.filters = filters;
	}

	public String getSqlBody() {
		return sqlBody.toString();
	}

	public Object[] getSqlParams() {
		Object[] params = new Object[sqlParams.size()];
		sqlParams.toArray(params);
		return params;
	}

	public void build() {
//		Sys sys = Sys.getInstance();
//		if ("mysql".equalsIgnoreCase(sys.get("db"))) {
			sqlBody = new StringBuffer(sql);
			sqlParams = new ArrayList<Object>();
			
			buildCond();
			
			if (page.isOrderBySetted()) {
				String[] orderBy = page.getOrderBy().split(",");
				String direction = page.getOrder();
				sqlBody.append(" order by ");
				for (int i = 0; i < orderBy.length; i++) {
					sqlBody.append(orderBy[i] + " " + direction);
					if (i != orderBy.length-1) {
						sqlBody.append(",");
					}
				}
			}
			
			sqlBody.append(" limit ?,? ");
			sqlParams.add(page.getFirst()-1);
			sqlParams.add(page.getPageSize());
//		}
		logger.info(getSqlBody());
	}

	public void build4count() {
//		Sys sys = Sys.getInstance();
//		if ("mysql".equalsIgnoreCase(sys.get("db"))) {
			sqlBody = new StringBuffer(sql);
			sqlParams = new ArrayList<Object>();
			buildCond();
//		}
		logger.info(getSqlBody());
	}

	private void buildCond() {
		if (filters != null && filters.size() > 0) {
			for (PropertyFilter filter : filters) {
				sqlBody.append(" and " + filter.getPropertyName() + " ");
				switch (filter.getMatchType()) {
				case LIKE:
					sqlBody.append(" like ? ");
					break;
				case EQ:
					sqlBody.append(" =? ");
					break;
				case GT:
					sqlBody.append(" >? ");
					break;
				default:
					sqlBody.append(" =? ");
				}

				if (filter.getMatchType() != MatchType.LIKE) {
					sqlParams.add(filter.getPropertyValue());
				} else {
					sqlParams.add("%" + filter.getPropertyValue() + "%");
				}
			}

		}
	}
}
