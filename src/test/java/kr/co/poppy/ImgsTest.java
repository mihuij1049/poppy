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

import kr.co.poppy.model.Imgs;

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

public class ImgsTest {
	
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
    	Imgs input = new Imgs();
    	input.setImgtype("A");
        input.setImgsno(2);
        sqlSession.selectOne("ImgsMapper.selectItem", input);
    }
    
    /** 데이터 저장 테스트 */
    @Test
    public void testB() {        
    	Imgs input = new Imgs();
        input.setImgname("IMG_20190606_073025");
        input.setImgext("jpg");
        input.setImgpath("/Users/eunhye/Desktop");
        input.setImgsize(1);
        input.setImgtype("A");
        input.setRegdate(date);
		input.setEditdate(date);
		input.setGoodsno(1);
		input.setBbsno(1);
        sqlSession.insert("ImgsMapper.insertItem", input);
    }
    
    /** 데이터 삭제 테스트 */
    @Test
    public void testC() {        
    	Imgs input = new Imgs();
        input.setImgsno(3);
        sqlSession.delete("ImgsMapper.deleteItem", input);
    }
    
    /** 데이터 수정 테스트 */
    @Test
    public void testD() {        
    	Imgs input = new Imgs();
    	input.setImgsno(2);
    	input.setImgtype("B");
        sqlSession.update("ImgsMapper.updateItem", input);
    }
    
    @Test
    public void testE() {
    	Imgs input = new Imgs();
    	input.setGoodsno(2);
    	sqlSession.update("ImgsMapper.unsetGoods", input);
    }
    
    @Test
    public void testF() {
    	Imgs input = new Imgs();
    	input.setBbsno(2);
    	sqlSession.update("ImgsMapper.unsetBbs", input);
    }

}
