package org.ccs.cyperweb.model;

import java.io.Serializable;

/**
 * 
 * @author cyper.yin
 * 
 */
public class Profile implements Serializable {
	private static final long serialVersionUID = 3951258443839797341L;
	private Long id;
	private String name;

	public Profile(){}
	
	
	public Profile(String name) {
		super();
		this.name = name;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
