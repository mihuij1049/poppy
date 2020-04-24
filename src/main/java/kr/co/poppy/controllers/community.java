package kr.co.poppy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class community {
	
	/** article */
	@RequestMapping(value="/community/article.do", method=RequestMethod.GET)
	public String article() {
		return "community/article";
	}
	
	/** notice */
	@RequestMapping(value="/community/notice.do", method=RequestMethod.GET)
	public String notice() {
		return "community/notice";
	}
	
	/** photo_rv */
	@RequestMapping(value="/community/photo_rv.do", method=RequestMethod.GET)
	public String photo_rv() {
		return "community/photo_rv";
	}
	
	/** photo_wri */
	@RequestMapping(value="/community/photo_wri.do", method=RequestMethod.GET)
	public String photo_wri() {
		return "community/photo_wri";
	}
	
	/** photo */
	@RequestMapping(value="/community/photo.do", method=RequestMethod.GET)
	public String photo() {
		return "community/photo";
	}
	
	/** qna_wri */
	@RequestMapping(value="/community/qna_wri.do", method=RequestMethod.GET)
	public String qna_wri() {
		return "community/qna_wri";
	}
	
	/** qna */
	@RequestMapping(value="/community/qna.do", method=RequestMethod.GET)
	public String qna() {
		return "community/qna";
	}

}
