package fr.li.spring.mvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class UseCasesController {
	
	//@Autowired
	//private IServiceQueryResult service;
	
	private String pageRef = "useCases";

    @RequestMapping(value="/useCases", method = RequestMethod.GET)
    public String afficher(ModelMap pModel) {
    	pModel.addAttribute("pageRef", pageRef);
    	
        return "usecases";
    }
    
}
