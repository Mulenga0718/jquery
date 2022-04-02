package kr.or.ddit.zip.service;

import java.util.List;
import java.util.Map;

public interface IZipService {
	
	public List<String> selectSido();

	public List<String> selectGugun(String sido);

	public List<String> selectDong(Map<String, String> map);
	
	public List<String> selectzip(Map<String, String> map);
	
	
}
