package com.infohub.project.myarticle;

import java.util.List;

public interface MyarticleDAO {
	public List<MyarticleDTO> listAll(String keyword);
	public int count(String keyword);
}
