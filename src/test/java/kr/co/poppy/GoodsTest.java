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

import kr.co.poppy.model.Goods;

/** JUnit에 의한 테스트 클래스로 정의 */
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class GoodsTest {
	/** MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;

	Calendar c = Calendar.getInstance();
	String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
			c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));

	/** 목록 조회 테스트 */
	@Test
	public void testA() {
		sqlSession.selectList("GoodsMapper.selectList", null);
	}

	/** 상세 조회 테스트 */
	@Test
	public void testB() {
		Goods input = new Goods();
		input.setGoodsno(1);
		sqlSession.selectOne("GoodsMapper.selectItem", input);
	}

	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		Goods input = new Goods();
		input.setGcode("123qwe!@#");
		input.setGname("신규 상품");
		input.setGinfo("신규 상품 설명~");
		input.setGprice(49500);
		input.setGsale(39500);
		input.setGdate("2020-04-27 00:00:00");
		input.setCate1("푸드");
		input.setCate2("건식사료");
		input.setRegdate(date);
		input.setEditdate(date);
		sqlSession.insert("GoodsMapper.insertItem", input);
	}

	/** 데이터 수정 테스트 */
	@Test
	public void testD() {
		Goods input = new Goods();
		input.setGoodsno(7);
		input.setGcode("123qwe!@#");
		input.setGname("수정된 상품");
		input.setGinfo("수정된 상품 설명~");
		input.setGprice(49500);
		input.setGsale(39500);
		input.setGdate("2020-04-27 00:00:00");
		input.setCate1("푸드");
		input.setCate2("건식사료");
		input.setEditdate(date);
		sqlSession.update("GoodsMapper.updateItem", input);
	}

	/** 데이터 삭제 테스트 */
	@Test
	public void testE() {
		Goods input = new Goods();
		input.setGoodsno(12);
		sqlSession.delete("GoodsMapper.deleteItem", input);
	}
}