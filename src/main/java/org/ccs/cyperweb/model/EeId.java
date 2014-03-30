package org.ccs.cyperweb.model;

import java.io.Serializable;

public class EeId implements Serializable {
	private String cty;
	private String sn;

	public boolean equals(Object o) {
		return ((o instanceof EeId) && cty.equals(((EeId) o).getCty()) && sn.equals(((EeId) o).getSn()));
	}

	public int hashCode() {
		return cty.hashCode() + sn.hashCode();
	}

	
	public String getCty() {
		return cty;
	}

	public void setCty(String cty) {
		this.cty = cty;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}
}
