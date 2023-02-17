package com.lithan.csp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.util.StringUtils;

import com.lithan.csp.Uploader;
import com.lithan.csp.entity.Bid;
import com.lithan.csp.entity.Cars;
import com.lithan.csp.entity.WebUser;
import com.lithan.csp.service.WebService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

@RestController
public class HomeController {
	
	@Autowired
	public WebService serv;
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public ModelAndView login(Model model, String error, String logout) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form/Login");
		
		if (error != null) {
            model.addAttribute("errorMsg", "Your username and password are invalid.");
		}
        if (logout != null) {
            model.addAttribute("msg", "You have been logged out successfully.");
        }
		return mv;
	}
	
	@GetMapping({"home","/"})
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("about")
	public ModelAndView aboutUs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("AboutUs");
		return mv;
	}
	@GetMapping("contact")
	public ModelAndView contactUs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ContactUs");
		return mv;
	}
	@GetMapping("carlist")
	public ModelAndView carList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("CarList");
		mv.addObject("title", "Cars List");
		mv.addObject("cars", serv.getAllNormalCars());
		return mv;
	}
	@GetMapping("auction-hall")
	public ModelAndView auction() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Auction");
		mv.addObject("title", "Auction Hall");
		mv.addObject("cars", serv.getAllBidCars());
		return mv;
	}
//	add regular car
	@GetMapping("/sale-car")
    public ModelAndView showAddCarsForm(Cars car) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form/CarForm");
		mv.addObject("title", "Sell a Car");

		return mv;
    }
//	add bid car
	@GetMapping("/sale-bid-car")
    public ModelAndView showAddBidCarsForm(Cars car) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form/CarForm");
		mv.addObject("title", "Sell a Bid Car");
		mv.addObject("bid",true);
		
		return mv;
    }
// 	edit car
	@GetMapping("/edit-car/{id}")
    public ModelAndView editCar(@PathVariable("id")int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form/CarForm");
		mv.addObject("title", "Edit Car");
		mv.addObject("car",serv.getSingleCar(id).get());
		mv.addObject("bid",true);
		mv.addObject("edit",true);
		return mv;
    }
	@RequestMapping(value = { "/edit-car/{id}" }, method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public RedirectView editCars(@RequestPart("imagess") MultipartFile multipartfile,
    		Cars car,Authentication authentication, @PathVariable("id")int id) throws IOException {
        String filename = StringUtils.cleanPath(multipartfile.getOriginalFilename());
        car.setId(id);
        car.setImage(filename);
        car.setPostedBy(authentication.getName());
        Cars savedCar = serv.addCar(car);
        String upDir ="src/main/resources/static/cars-img/"+serv.getLatestCarId();
        Path upPath = Paths.get(upDir);
        new Uploader(filename,multipartfile,upDir);

        return new RedirectView("/carlist");
    }
	@RequestMapping(value = { "/sale-bid-car" }, method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public RedirectView addBidCars(@RequestPart("imagess") MultipartFile multipartfile,
    		Cars car,Authentication authentication) throws IOException {
        String filename = StringUtils.cleanPath(multipartfile.getOriginalFilename());
        car.setImage(filename);
        car.setPostedBy(authentication.getName());
        Cars savedCar = serv.addCar(car);
        String upDir ="src/main/resources/static/cars-img/"+serv.getLatestCarId();
        Path upPath = Paths.get(upDir);
        new Uploader(filename,multipartfile,upDir);

        return new RedirectView("/carlist");
    }
	@RequestMapping(value = { "/sale-car" }, method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public RedirectView addCars(@RequestPart("imagess") MultipartFile multipartfile,
    		Cars car,Authentication authentication) throws IOException {
        String filename = StringUtils.cleanPath(multipartfile.getOriginalFilename());
        car.setImage(filename);
        car.setPostedBy(authentication.getName());
        Cars savedCar = serv.addCar(car);
        String upDir ="src/main/resources/static/cars-img/"+serv.getLatestCarId();
        Path upPath = Paths.get(upDir);
        new Uploader(filename,multipartfile,upDir);

        return new RedirectView("/carlist");
    }
	@GetMapping("car-detail")
	public ModelAndView carDetail(@RequestParam("id")int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("CarDetail");
		Optional<Cars> car = serv.getSingleCar(id);
		mv.addObject("bids",car.get().getBids());
		mv.addObject("title", car.get().getName());
		mv.addObject("car",car.get());
		
		return mv;
	}
	
	@PostMapping("/bid")
	public RedirectView bid(@RequestParam("amount")int amount,
							@RequestParam("car-id")int car_id, 
							HttpServletRequest req,
							Authentication auth) {
		Bid bid = new Bid();
		Optional<Cars> car = serv.getSingleCar(car_id);
		bid.setPrice(amount);
		bid.setName(auth.getName());
		bid.setCar(new Cars(
					car.get().getId(),
					car.get().getName(),
					car.get().getMake(),
					car.get().getModel(),
					car.get().getImage(),
					car.get().getYear(),
					car.get().getPrice(),
					car.get().getPostedBy(),
					car.get().getBiddingDate(),
					car.get().getBids()
					));
		serv.addBid(bid);
		return new RedirectView(req.getHeader("Referer"));
	}
	
	@GetMapping("search")
	public ModelAndView search(@RequestParam("search")String keyword) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("SearchResult");
		mv.addObject("title", "You Search for "+keyword);
		mv.addObject("cars",serv.search(keyword));
		mv.addObject("search",keyword);
		return mv;
	}
	
	@GetMapping("store")
	@PreAuthorize("hasAuthority('ROLE_USER')")
	public ModelAndView userStore(Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MyStore");
		mv.addObject("title", "My Store	");
		mv.addObject("cars",serv.getAllCarsFormSingleUser(authentication.getName()));
		return mv;
	}
	
	
	@GetMapping("profile")
	public ModelAndView userProfile(Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Profile");
		Optional<WebUser> user = serv.getSingleUser(authentication.getName());
		
		mv.addObject("title", "Profile");
		mv.addObject("user",user);
		
		return mv;
	}
	
	@GetMapping("list-of-user")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ModelAndView listOfUser(Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Users");
		mv.addObject("title", "Administration Panel");
		mv.addObject("cars",serv.getAllCars());
		mv.addObject("users",serv.getAllUsers());
		
		return mv;
	}
	
	@GetMapping("grand-authorities")
	public RedirectView grandAuth(@RequestParam(name="name")String name) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Users");
		serv.grandAuth(name);
		return new RedirectView("/list-of-user");
	}
	
//	EDIT USER
	@GetMapping("edit-profile")
	public ModelAndView processEditProfile(@RequestParam(name="name")String name){
		ModelAndView mv = new ModelAndView();
		Optional<WebUser> user = serv.getSingleUser(name);
		mv.setViewName("form/EditProfile");
		mv.addObject("title", "Edit Profile");
		mv.addObject("user",user.get());
		return mv;
	}
	@GetMapping("delete-user")
	public RedirectView deleteUser(@ModelAttribute("id")int id){
		serv.deleteUser(id);
		return new RedirectView("/list-of-user");
	}
	@GetMapping("delete-car")
	public RedirectView deleteCar(@ModelAttribute("id")int id){
		serv.deleteCar(id);
		return new RedirectView("/list-of-user");
	}
	
	@PostMapping("process-edit-user")
	public RedirectView processEditUser(@ModelAttribute("user")WebUser user,Authentication authentication){
//		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
//		String auth ="";
//		for(GrantedAuthority authority : authorities) {
//			auth += authority.getAuthority();
//		}
//		user.setRole(auth);
		System.out.println(user);
		serv.addUser(user);
		return new RedirectView("/logout");
	}
	
//	REGISTER
	@GetMapping("register")
	public ModelAndView register(@ModelAttribute("user")WebUser user){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("form/Register");
		mv.addObject("title", "Register New User");
		return mv;
	}
	@PostMapping("process-register")
	public RedirectView processRegister(@ModelAttribute("user")WebUser user){
		user.setRole("ROLE_USER");
		System.out.println(user);
		serv.addUser(user);
		return new RedirectView("/login");
	}
}
