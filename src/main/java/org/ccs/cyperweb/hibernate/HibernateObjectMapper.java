package org.ccs.cyperweb.hibernate;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;

public class HibernateObjectMapper extends ObjectMapper {
	public HibernateObjectMapper() {
		disable(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS);
	}
}