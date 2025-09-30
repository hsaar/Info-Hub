package com.infohub.project.myarticle;

import java.util.List;

public interface MyarticleService {
	public List<MyarticleDTO> listAll(String tag);
	public int count(String tags);
}
