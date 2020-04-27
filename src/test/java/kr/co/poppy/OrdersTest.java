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
import kr.co.poppy.model.Orders;



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
public class OrdersTest {

    /** MyBatis의 SQL세션 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private SqlSession sqlSession;

    /** 목록 조회 테스트 */
    // import org.junit.Test;
    @Test
    public void testA() {
    	Orders input = new Orders();
    	input.setMemno(2);
        sqlSession.selectList("OrdersMapper.selectList", input);
    }
    
    /** 상세 조회 테스트 */
    @Test
    public void testB() {    
        // import study.spring.springhelper.model.Orders;
    	Orders input = new Orders();
        input.setOrderno(2);
        sqlSession.selectOne("OrdersMapper.selectItem", input);
    }
    
    /** 데이터 저장 테스트 */
    @Test
    public void testC() {        
    	Orders input = new Orders();
    	input.setOdmsg("반가워요");
        input.setPaytype("A");
        input.setOdstatus("1");
        input.setDeliprice(2500);
        input.setRegdate("now()");
        input.setEditdate("now()");
        input.setMemno(2);
        input.setAddrno(2);    
        sqlSession.insert("OrdersMapper.insertItem", input);
    }
    
    /** 데이터 수정 테스트 */
    @Test
    public void testD() {        
    	Orders input = new Orders();
        input.setOdmsg("잘부탁드려요.");
        input.setPaytype("B");
        input.setOdstatus("2");
        input.setDeliprice(2500);
        input.setEditdate("now()");
        input.setMemno(5);
        sqlSession.update("OrdersMapper.updateItem", input);
    }
    
    /** 데이터 삭제 테스트 */
    @Test
    public void testE() {        
    	Orders input = new Orders();
        input.setOrderno(10);
        sqlSession.delete("OrdersMapper.deleteItem", input);
    }
}