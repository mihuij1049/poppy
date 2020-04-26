package kr.co.poppy.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Rvheart;
import kr.co.poppy.service.RvheartService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RvheartServiceImpl implements RvheartService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int getRvheartCount(Rvheart input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("RvheartMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public int addRvheart(Rvheart input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("RvheartMapper.insertItem", input);

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
	public int deleteRvheart(Rvheart input) throws Exception {
		return 0;
	}

}
