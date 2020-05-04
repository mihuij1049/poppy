package kr.co.poppy.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Members;
import kr.co.poppy.service.MembersService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MembersServiceImpl implements MembersService {
	
	/** DB조회를 위한 MyBatis 객체 주입 */
	@Autowired
	SqlSession sqlSession;
	
	/** 회원가입 
	 * @Param  회원의 정보를 담고 있는 Beans
	 * @return int
	 */
	@Override
	public int addMembers(Members input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.insert("MembersMapper.add_members", input);
			if(result==0) {
				result = sqlSession.selectOne("MembersMapper.select_item", input);
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}
	
	/** 회원 정보 조회
	 * @Param  회원의 일련번호(memno)를 담고 있는 Beans
	 * @return  조회된 회원의 정보를 담고 있는 Beans
	 */
	@Override
	public Members getMembersItem(Members input) throws Exception {
		Members output = null;
		try {
			output = sqlSession.selectOne("MembersMapper.select_item", input);
			if (output == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}
	
	/** 회원 정보 조회 로그인 기능
	 * @Param  회원의 아이디(userid)와 비밀번호(userpw) 를 담고 있는 Beans
	 * @return  조회된 회원의 정보를 담고 있는 Beans
	 */
	@Override
	public Members loginMembers(Members input) throws Exception {
		Members output = null;
		try {
			output = sqlSession.selectOne("MembersMapper.login_members", input);
			if (output == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}
	
	/** 회원 정보 조회 아이디찾기 기능
	 * @Param  회원의 이름(username)과 이메일(useremail)을 담고 있는 Beans
	 * @return  조회된 회원의 정보를 담고 있는 Beans
	 */
	
	@Override
	public Members findIdMembers(Members input) throws Exception {
		Members output = null;
		try {
			output = sqlSession.selectOne("MembersMapper.findId_members", input);
			if (output == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}
	
	/** 회원 정보 조회 임시비밀번호 수정 기능
	 * @Param  회원의 이름(username)과 아이디(userid) 이메일(useremail)을 담고 있는 Beans
	 * @return int
	 */

	@Override
	public int editPwMembers(Members input) throws Exception {
		int result = 0;
		try  {
			result = sqlSession.update("MembersMapper.editPw_members", input);
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/** 회원 정보 수정
	 * @Param  회원의 일련번호를 담고 있는 Beans
	 * @return int 
	 */
	@Override
	public int editMembers(Members input) throws Exception {
		int result = 0;
		try  {
			result = sqlSession.update("MembersMapper.edit_members", input);
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/** 회원 탈퇴 기능
	 * @Param  회원의 일련번호를 담고 있는 Beans
	 * @return int
	 */
	@Override
	public int deleteMembers(Members input) throws Exception {
		int result = 0;
		try  {
			result = sqlSession.update("MembersMapper.delete_members", input);
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
	
}
