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

import kr.co.poppy.model.Address;



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
public class AddressTest {

    /** MyBatis의 SQL세션 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private SqlSession sqlSession;

    /** 목록 조회 테스트 */
    // import org.junit.Test;
    @Test
    public void testA() {
    	Address input = new Address();
    	input.setMemno(2);
        sqlSession.selectList("AddressMapper.selectList", input);
    }
    
    /** 상세 조회 테스트 */
    @Test
    public void testB() {    
        // import study.spring.springhelper.model.Address;
    	Address input = new Address();
        input.setMemno(1);
        sqlSession.selectOne("AddressMapper.selectItem", input);
    }
    
    /** 데이터 저장 테스트 */
    @Test
    public void testC() {        
    	Address input = new Address();
    	input.setOdname("조대철");
        input.setOdphone("010-8222-9650");
        input.setOdemail("yyaa9650@gmail.com");
        input.setZcode(05155);
        input.setAddr1("서울시");
        input.setAddr2("강동구");
        input.setRegdate("now()");
        input.setEditdate("now()");
        input.setMemno(3);      
        sqlSession.insert("AddressMapper.insertItem", input);
    }
    
    /** 데이터 수정 테스트 */
    @Test
    public void testD() {        
    	Address input = new Address();
        input.setOdname("하정우");
        input.setZcode(00000);
        input.setAddr1("서초구");
        input.setAddr2("이젠쓰");
        input.setOdphone("010-8222-9650");
        input.setOdemail("poppy@ezen.com");
        input.setEditdate("now()");
        input.setMemno(2);
        sqlSession.update("AddressMapper.updateItem", input);
    }
    
    /** 데이터 삭제 테스트 */
    @Test
    public void testE() {        
    	Address input = new Address();
        input.setAddrno(12);
        sqlSession.delete("AddressMapper.deleteItem", input);
    }
}