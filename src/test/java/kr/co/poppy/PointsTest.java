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

import kr.co.poppy.model.Points;

/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring 의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름 순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixmethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PointsTest {

	/** MyBatis 의 SqlSession 주입 설정 */
	@Autowired
	private SqlSession sqlSession;

	Calendar c = Calendar.getInstance();
	String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
			c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));

	/** 주문 결제 시 적립금 발생 */
	@Test
	public void testA() {

		Points input = new Points();
		input.setAvpoint(0);
		input.setNapoint(2500);
		input.setPointtype("B");
		input.setRegdate(date);
		input.setEditdate(date);
		input.setMemno(3);
		input.setOrderno(1);

		sqlSession.insert("PointsMapper.add_points", input);
	}

	/** 회원 번호로 적립금 조회 */
	@Test
	public void testB() {
		Points input = new Points();
		input.setMemno(3);

		sqlSession.selectList("PointsMapper.select_members_item", input);
	}
	
	/** 주문 번호로 적립금 조회 (구매 상품의 적립금 표시) */
	@Test
	public void testC() {
		Points input = new Points();
		input.setOrderno(3);
		
		sqlSession.selectOne("PointsMapper.select_order_item", input);
	}

	/** 미가용 적립금 -> 가용 적립금 전환 업데이트 */
	@Test
	public void testD() {

		Points input = new Points();
		input.setAvpoint(2500);
		input.setNapoint(0);
		input.setEditdate(date);
		input.setPointno(7);
		
		sqlSession.update("PointsMapper.edit_av_points", input);
	}

	/** 적립금 사용 시 0 으로 업데이트 (삭제 대용) */
	@Test
	public void testE() {
		Points input = new Points();
		input.setAvpoint(0);
		input.setEditdate(date);
		input.setPointno(3);
		
		sqlSession.update("PointsMapper.edit_use_points", input);
	}
	
}
