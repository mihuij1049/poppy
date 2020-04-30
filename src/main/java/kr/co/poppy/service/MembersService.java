package kr.co.poppy.service;

import kr.co.poppy.model.Members;

public interface MembersService {
	
	/** 회원 정보를 저장하기 
	 * 
	 * @Param  입력받은 회원 정보를 담고 있는 Beans 객체
	 * @return int
	 * @throws Exception
	 */
	public int addMembers(Members input) throws Exception;
	
	/** 회원 정보 검색하기
	 * 
	 * @Param 회원의 memno를 담고 있는 Beans 객체
	 * @return 조회한 정보를 담은 Beans 객체
	 * @throws Exception
	 */
	public Members getMembersItem(Members input) throws Exception;
	
	/** 회원 정보 조회 로그인 기능
	 * @Param  회원의 아이디(userid)와 비밀번호(userpw) 를 담고 있는 Beans
	 * @return  조회된 회원의 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public Members loginMembers(Members input) throws Exception;
	
	/** 회원 정보 조회 아이디찾기 기능
	 * @Param  회원의 이름(username)과 이메일(useremail)을 담고 있는 Beans
	 * @return  조회된 회원의 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public Members findIdMembers(Members input) throws Exception;
	
	/** 회원 정보 수정하기
	 * 
	 * @Param 회원의 수정된 정보가 담긴 Beans 객체
	 * @return int
	 * @throws Exception
	 */
	public int editMembers(Members input) throws Exception;
	
	/** 회원 탈퇴 기능
	 * 
	 * @Param 회원의 memno를 담고 있는 Beans 객체 
	 * @return int
	 * @throws  Exception
	 */
	public int deleteMembers(Members input) throws Exception;
	
}
