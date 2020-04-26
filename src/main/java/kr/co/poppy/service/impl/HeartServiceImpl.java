package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Heart;
import kr.co.poppy.service.HeartService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HeartServiceImpl implements HeartService {
	
	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	HeartService heartService;
	
	/** ContextPath 변수 주입 */
	@Value("#{serviceContext.contextPath}")
	String contextPath;

	@Override
	public Heart getHeartItem(Heart input) throws Exception {
		Heart result = null;

        try {
            result = sqlSession.selectOne("HeartMapper.selectItem", input);

            if (result == null) {
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

	@Override
	public List<Heart> getHeartList(Heart input) throws Exception {
		List<Heart> result = null;

        try {
            result = sqlSession.selectList("HeartMapper.selectList", input);

            if (result == null) {
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

	@Override
	public int getHeartCount(Heart input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("HeartMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public int addHeart(Heart input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("HeartMapper.insertItem", input);

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
	public int deleteHeart(Heart input) throws Exception {
		int result = 0;

        try {
        	result = sqlSession.delete("HeartMapper.deleteItem", input);
        	
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
}
