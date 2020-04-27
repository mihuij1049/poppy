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

import kr.co.poppy.model.Heart;

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

public class HeartTest {
    /** MyBatis의 SQL 세션 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private SqlSession sqlSession;

    /** 단일행 조회 테스트 */
    @Test
    public void testA() {
        Heart input = new Heart();
        input.setHeartno(1);
        input.setGoodsno(1);
        sqlSession.selectOne("HeartMapper.selectItem", input);
    }

    /** 다중행 조회 테스트 */
    @Test
    public void testB() {
        sqlSession.selectList("HeartMapper.selectList", null);
    }

    /** 데이터 수 조회 테스트 */
    @Test
    public void testC() {
        Heart input = new Heart();
        input.setMemno(1);
        sqlSession.selectOne("HeartMapper.selectCountAll", input);
    }

    /** 데이터 저장 테스트 */
    @Test
    public void testD() {
        Heart input = new Heart();
        input.setRegdate("2010-10-10");
        input.setEditdate("2010-10-10");
        input.setMemno(1);
        input.setGoodsno(1);
        sqlSession.insert("HeartMapper.insertItem", input);
    }

    /** 데이터 삭제 테스트 */
    @Test
    public void testE() {
        Heart input = new Heart();
        input.setHeartno(4);
        sqlSession.delete("HeartMapper.deleteItem", input);
    }
}