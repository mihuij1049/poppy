package kr.co.poppy;

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

	    
	    /** 상세 조회 테스트1 */
	    @Test
	    public void testA() {    
	    	Bbs input = new Bbs();
	        input.setBbstype("A");
	        input.setBbsno(1);
	        sqlSession.selectOne("BbsMapper.selectItem1", input);
	    }
	    
	    /** 상세 조회 테스트2 */
	    @Test
	    public void testB() {    
	    	Bbs input = new Bbs();
	        input.setBbstype("B");
	        input.setBbsno(2);
	        sqlSession.selectOne("BbsMapper.selectItem2", input);
	    }
	    
	    /** 목록 조회 테스트 */
	    // import org.junit.Test;
	    @Test
	    public void testC() {
	        sqlSession.selectList("BbsMapper.selectList", null);
	    }
	    
	    /** 데이터 저장 테스트 */
	    @Test
	    public void testD() {        
	    	Bbs input = new Bbs();
	        input.setBbstype("A");
	        input.setBbstitle("안녕하세요");
	        input.setBbscontent("내용");
	        sqlSession.insert("BbsMapper.insertItem", input);
	    }
	    /** 데이터 수정 테스트 */
	    @Test
	    public void testE() {        
	    	Bbs input = new Bbs();
	    	input.setBbsno(1);
	        input.setBbstitle("제목");
	        sqlSession.update("BbsMapper.updateItem", input);
	    }
	    
	    /** 데이터 삭제 테스트 */
	    @Test
	    public void testF() {        
	    	Bbs input = new Bbs();
	        input.setBbsno(2);
	        sqlSession.delete("BbsMapper.deleteItem", input);
	    }
	   
	}