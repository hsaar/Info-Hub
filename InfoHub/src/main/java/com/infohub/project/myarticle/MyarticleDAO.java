package com.infohub.project.myarticle;

import java.util.List;

public interface MyarticleDAO {
	public List<MyarticleDTO> listAll(String tags);
	public int count(String tags);
}
