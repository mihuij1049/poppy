package kr.co.poppy.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Agree;
import kr.co.poppy.service.AgreeService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AgreeServiceImpl implements AgreeService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int addAgree(Agree input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("AgreeMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
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

	@Override
	public int editAgree(Agree input) throws Exception {
		int result=0;
		try {
			result = sqlSession.update("AgreeMapper.updateItem", input);
				if (result == 0) {
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

	@Override
	public int deleteAgree(Agree input) throws Exception {
		int result = 0;

        try {
        	result = sqlSession.delete("AgreeMapper.deleteItem", input);
        	
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        return result;
	}
	
	/**
	 * 약관동의 데이터 조회하기
	 * @param 동의한 시간(regdate)을 담고 있는 Beans
	 * @return Agree Beans
	 */
	@Override
	public Agree getAgreeItem(Agree input) throws Exception {
		Agree result = null;
		
		try {
			result = sqlSession.selectOne("AgreeMapper.get_agree_item", input);
			
			if (result==null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
		
		return result;
	}
	

}
