package org.ccs.cyperweb.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(EeId.class)
public class Ee implements Serializable {
	@Id
	private String cty;
	@Id
	private String sn;

	private String name;

	private int salary;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

}
