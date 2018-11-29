package hello;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import hello.Batis.*;

@Controller
public class GreetingController {

	private final HelloService HelloService;

	@Autowired
	public GreetingController(HelloService HelloService) {
		this.HelloService = HelloService;

	}

	private static List<HelloModel> data = new ArrayList<HelloModel>();

	@GetMapping("/listAll")
	public String greetingSubmit( Model model) {
		data.clear();
		for (HelloModel h : HelloService.selectAll()) {
			data.add(h);
		}
		model.addAttribute("data", data);

		return "listAll";
	}

	@GetMapping("/greeting")
	public String greetingForm(Model model) {
		model.addAttribute("greeting", new Greeting());
		return "greeting";
	}

	@PostMapping("/greeting")
	public String greetingSubmit(@ModelAttribute Greeting greeting, Model model) {

		String query = greeting.getContent();
		// String query="SELECT * FROM liftData where alarm_bell=1";
		data.clear();
		for (HelloModel h : HelloService.selectSQL(query)) {
			data.add(h);
		}
		model.addAttribute("data", data);

		return "result";
	}

}
