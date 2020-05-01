package kr.co.poppy.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.poppy.model.Heart;
import kr.co.poppy.model.Imgs;




@Service

public interface ImgsService {
	/**
	 * 이미지 데이터 상세 조회
	 * @param Image 조회할 주소의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Imgs getImgsItem(Imgs input) throws Exception;
	
	/**
	 * 이미지 데이터 목록 조회
	 * @param Image 조회할 주소의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Imgs> getImgsList(Imgs input) throws Exception;
	
	/**
	 * 이미지 데이터 등록하기
	 * @param Imgs 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addImgs(Imgs input) throws Exception;
	
	/**
	 * 이미지 데이터 수정하기
	 * @param Imgs 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editImgs(Imgs input) throws Exception;
	
	/**
	 * 이미지 데이터 삭제하기
	 * @param Imgs 삭제할 주소의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteImgs(Imgs input) throws Exception;
	

}


 	