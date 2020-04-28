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

import kr.co.poppy.model.Agree;

/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정(설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class AgreeTest {

    /** MyBatis의 SQL 세션 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private SqlSession sqlSession;
    
    @Test
    public void testA() {
        /** 데이터 저장 테스트 */
        Agree input = new Agree();
        input.setUseagree(1);
        input.setPrivateagree(1);
        input.setEmailagree(1);
        input.setShoppingagree(1);
        input.setRegdate("2010-10-10");
        input.setEditdate("2010-10-10");
        input.setMemno(1);
        sqlSession.insert("AgreeMapper.insertItem", input);
    }


    @Test
    public void testC() {
        /** 데이터 갱신 테스트 */
        Agree input = new Agree();
        input.setAgreeno(1);
        input.setUseagree(1);
        input.setPrivateagree(1);
        input.setEmailagree(0);
        input.setShoppingagree(0);
        input.setRegdate("2000-10-10");
        input.setEditdate("2000-10-10");
        sqlSession.update("AgreeMapper.updateItem", input);
    }
}