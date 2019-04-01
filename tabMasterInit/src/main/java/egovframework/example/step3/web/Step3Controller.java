package egovframework.example.step3.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Step3Controller {

	@RequestMapping(value="/step3/page17.do")
	public String page17Init() throws Exception{
		
		return "step3/page17";
	}
	
	@RequestMapping(value="/step3/page18.do")
	public String page18Init() throws Exception{
		
		return "step3/page18";
	}
	
	@RequestMapping(value="/step3/page19.do")
	public String page19Init() throws Exception{
		
		return "step3/page19";
	}
	
}
