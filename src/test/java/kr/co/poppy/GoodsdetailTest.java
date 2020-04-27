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

import kr.co.poppy.model.Goodsdetail;

/** JUnit에 의한 테스트 클래스로 정의 */
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class GoodsdetailTest {
	/** MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;

	Calendar c = Calendar.getInstance();
	String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
			c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));

	/** 목록 조회 테스트 */
	@Test
	public void testA() {
		Goodsdetail input = new Goodsdetail();
		sqlSession.selectList("GoodsdetailMapper.selectList", input);	
	}

	/** 상세 조회 테스트 */
	@Test
	public void testB() {
		Goodsdetail input = new Goodsdetail();
		input.setGoodsno(3);
		sqlSession.selectOne("GoodsdetailMapper.selectItem", input);
	}

	/** 데이터 저장 테스트 */
	@Test
	public void testC() {
		Goodsdetail input = new Goodsdetail();
		input.setGdoption("신규 옵션!!");
		input.setGdstock(99);
		input.setRegdate(date);
		input.setEditdate(date);
		input.setGoodsno(1);
		sqlSession.insert("GoodsdetailMapper.insertItem", input);
	}

	/** 데이터 수정 테스트 */
	@Test
	public void testD() {
		Goodsdetail input = new Goodsdetail();
		input.setGddetailno(8);
		input.setGdoption("변경된 옵션!!");
		input.setGdstock(99);
		input.setEditdate(date);
		input.setGoodsno(1);
		sqlSession.update("GoodsdetailMapper.updateItem", input);
	}

	/** 데이터 삭제 테스트 */
	@Test
	public void testE() {
		Goodsdetail input = new Goodsdetail();
		input.setGddetailno(9);
		sqlSession.delete("GoodsdetailMapper.deleteItem", input);
	}
}
