package kr.co.poppy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Comments;
import kr.co.poppy.service.CommentsService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommentsServiceImpl implements CommentsService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Comments getCommentsItem(Comments input) throws Exception {
		Comments result = null;

        try {
            result = sqlSession.selectOne("CommentsMapper.selectItem", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다. c_selectItem");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        return result;
	}

	@Override
	public int addComments(Comments input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("CommentsMapper.insertItem", input);

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
	public int deleteComments(Comments input) throws Exception {
		int result = 0;

        try {
        	result = sqlSession.delete("CommentsMapper.deleteItem", input);
        	
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

	@Override
	public List<Comments> getCommentsList(Comments input) throws Exception {
		List<Comments> result = null;
		try {
			result = sqlSession.selectList("CommentsMapper.selectList", input);
			if(result==null) {
				throw new NullPointerException("result=null");
			} 
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.  c_selectList");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getCommentsCount(Bbs input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("CommentsMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int editComments(Comments input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("CommentsMapper.updateItem", input);
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
}
