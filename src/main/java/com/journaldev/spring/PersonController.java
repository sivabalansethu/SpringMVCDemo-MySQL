package com.journaldev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.PersonService;

@Controller
public class PersonController {
	
	private PersonService personService;
	
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}
	
	@RequestMapping(value = "/person", method = RequestMethod.GET)
	public ModelAndView getPerson() {
		System.out.println("CHECKING 111");
		ModelAndView mv = new ModelAndView("person");
		mv.addObject("listPersons", this.personService.listPersons());
		mv.addObject("Name", "WIPRO");
		return mv;
	}

	@RequestMapping(value = "/person/update", method = RequestMethod.GET)
	public ModelAndView updatePerson() {
		Person p = new Person();
		p.setProductId(12);;
		p.setName("VIVO mobile");
		p.setDescription("Vivo Mobile Phone");
		this.personService.placeOrderManagement(p);
		/*
		 * ModelAndView mv = new ModelAndView("person"); mv.addObject(new Person());
		 * mv.addObject("productList", this.personService.listPersons()); return mv;
		 */
		return null;
	}
	
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String placeOrderManagement(@ModelAttribute("person") Person p){
		System.out.println("CHECKING 3333" + p.getProductId() + ":" + p.getName() + ":" + p.getDescription());
		this.personService.placeOrderManagement(p);
		/*
		 * if(p.getProductId() == 0){ //new person, add it
		 * this.personService.addPerson(p); }else{ //existing person, call update
		 * this.personService.updatePerson(p); }
		 */
		
		return "redirect:/persons";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.personService.removePerson(id);
        return "redirect:/persons";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        return "person";
    }
	
}
