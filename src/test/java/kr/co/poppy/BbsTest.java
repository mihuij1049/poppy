package kr.co.poppy;

import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.poppy.model.Bbs;



	/** JUnit에 의한 테스트 클래스로 정의 */
	// import org.junit.runner.RunWith;
	// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
	@RunWith(SpringJUnit4ClassRunner.class)
	/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
	// import org.springframework.test.context.ContextConfiguration;
	@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
	/** 웹 어플리케이션임을 명시 */
	// import org.springframework.test.context.web.WebAppConfiguration;
	@WebAppConfiguration
	/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
	// import org.junit.FixMethodOrder;
	@FixMethodOrder(MethodSorters.NAME_ASCENDING)
	public class BbsTest {

	    /** MyBatis의 SQL세션 주입 설정 */
	    // import org.springframework.beans.factory.annotation.Autowired;
	    @Autowired
	    private SqlSession sqlSession;

	    Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));

		
	    /** 상세 조회 테스트1 */
	    @Test
	    public void testA() {    
	    	Bbs input = new Bbs();
	        input.setBbstype("B");
	        input.setBbsno(11);
	        sqlSession.selectOne("BbsMapper.selectItem1", input);
	    }
	    
	    /** 상세 조회 테스트2 */
	    @Test
	    public void testB() {    
	    	Bbs input = new Bbs();
	        input.setBbstype("A");
	        input.setBbsno(1);
	        sqlSession.selectOne("BbsMapper.selectItem2", input);
	    }
	    
	    /** 목록 조회 테스트 */
	    // import org.junit.Test;
	    @Test
	    public void testC() {
	    	Bbs input = new Bbs();
	        input.setBbstype("A");
	        sqlSession.selectList("BbsMapper.selectList", input);
	    }
	    
	    /** 데이터 저장 테스트 */
	    @Test
	    public void testD() {        
	    	Bbs input = new Bbs();
	        input.setBbstype("B");
	        input.setBbstitle("안녕하세요");
	        input.setBbscontent("내용");
	        input.setRegdate(date);
			input.setEditdate(date);
			input.setMemno(1);
			input.setGoodsno(1);
	        sqlSession.insert("BbsMapper.insertItem", input);
	    }
	    /** 데이터 수정 테스트 */
	    @Test
	    public void testE() {        
	    	Bbs input = new Bbs();
	    	input.setBbsno(3);
	        input.setBbstitle("이 상품 좋은거 맞아요?");
	        input.setBbscontent("잘쓰고있는데 좀 못미더워요.");
	        input.setRvlike("****");
	        input.setEditdate(date);
	        sqlSession.update("BbsMapper.updateItem", input);
	    }
	    
	    /** 데이터 삭제 테스트 */
	    @Test
	    public void testF() {        
	    	Bbs input = new Bbs();
	        input.setBbsno(2);
	        // bbs를 참조하는 댓글 삭제
	        sqlSession.delete("BbsMapper.delete_cmt_item", input);
	        // bbs를 참조하는 좋아요 삭제
	        sqlSession.delete("BbsMapper.delete_rvheart_item", input);
	        // bbs를 참조하는 img의 참조키 Null로 update
	        sqlSession.update("BbsMapper.unsetImgs", input);
	        // 게시글 삭제
	        sqlSession.delete("BbsMapper.deleteItem", input);
	    }
	   
	}