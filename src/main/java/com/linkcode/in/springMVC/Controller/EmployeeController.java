package com.linkcode.in.springMVC.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.linkcode.in.springMVC.POJO.AdminPOJO;
import com.linkcode.in.springMVC.POJO.EmployeePOJO;
import com.linkcode.in.springMVC.Service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService service;

	@GetMapping("/home")
	public String home(@SessionAttribute(value="login",required = false)AdminPOJO admin) {
		if(admin!=null) {
			return "Home";
		}

		return "Login";
	}


	//add employee
	//------------------------------------------------------------------------------------------------------------------------------


	@GetMapping("/addEmployee")
	public String addEmployeePage(@SessionAttribute(value="login",required = false)AdminPOJO admin) {
		if(admin!=null) {
			return "addEmployee";
		}
		return "Login";
	}

	@PostMapping("/addEmployee")
	public String addEmployee(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("department") String department,
			@RequestParam("salary") double salary) {

		EmployeePOJO emp = service.addEmployee(name, email, department, salary);

		if (emp != null) {
			return "Home";
		}

		return "addEmployee";
	}
	//------------------------------------------------------------------------------------------------------------------------------
	//SEARCH EMPLOYEE


	@GetMapping("/search")
	public String searchPage(@SessionAttribute(value="login",required = false)AdminPOJO admin) {

		if(admin!=null) {
			return "Search";
		}

		return "Login";
	}

	@PostMapping("/search")
	public String searchEmployee(@RequestParam("id") int id, ModelMap map) {

		EmployeePOJO pojo = service.searchEmployee(id);

		if (pojo != null) {
			map.addAttribute("emp", pojo);
			map.addAttribute("msg", "Employee Found");
		} else {
			map.addAttribute("msg", "Employee Not Found");
		}

		return "Search";
	}



	//UPDATE EMPLOYEE
	//------------------------------------------------------------------------------------------------------------------------------

	@GetMapping("/update")
	public String showUpdatePage(@SessionAttribute(value="login",required = false)AdminPOJO admin) {
		if(admin!=null) {
			return "Update";
		}

		return "Login";
	}


	// This handles the Search specifically for the Update form (URL changed to avoid Ambiguity)
	// Change this mapping to avoid the error
	@PostMapping("/searchUpdate") 
	public String searchForUpdate(@RequestParam("id") int id, ModelMap map) {
		EmployeePOJO emp = service.searchEmployee(id);
		if (emp != null) {
			map.addAttribute("emp", emp);
		} else {
			map.addAttribute("msg", "Employee not found!");
		}
		return "Update";
	}
	// This handles the actual DB update
	@PostMapping("/update")
	public String processUpdate(
			@RequestParam("id") int id,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("designation") String designation,
			@RequestParam("salary") double salary,
			ModelMap map) {

		service.updateEmployee(id, name, email, designation, salary);

		// Refresh the list to show updated data on the Remove/List page
		List<EmployeePOJO> emps = service.searchAllEmployee();
		map.addAttribute("employees", emps);
		map.addAttribute("msg", "Employee ID " + id + " updated successfully!");

		return "Remove"; 
	}







	//REMOVE EMPLOYEE
	//------------------------------------------------------------------------------------------------------------------------------


	@GetMapping("/removeEmployee")
	public String removeEmployeePage(ModelMap map,@SessionAttribute(value="login",required = false)AdminPOJO admin) {

		if(admin!=null) {

			List<EmployeePOJO> emps = service.searchAllEmployee();
			map.addAttribute("employees", emps);

			return "Remove";
		}
		return "Login";

	}

	@PostMapping("/remove")
	public String removeEmployee(@RequestParam("id") int id, ModelMap map) {
		EmployeePOJO emp = service.removeEmployee(id);
		List<EmployeePOJO> emps = service.searchAllEmployee();
		map.addAttribute("employees", emps);
		if (emp != null) {
			map.addAttribute("msg", "Employee with ID " + emp.getId() + " removed successfully");
		} else {
			map.addAttribute("msg", "Employee not found");
		}
		return "Remove";
	}






}
