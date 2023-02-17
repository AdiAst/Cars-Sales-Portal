package com.lithan.csp;

import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import com.lithan.csp.entity.Cars;
import com.lithan.csp.entity.WebUser;
import com.lithan.csp.repository.BidRepository;
import com.lithan.csp.repository.CarsRepository;
import com.lithan.csp.repository.WebUserRepository;
import com.lithan.csp.service.WebService;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

import org.junit.Before;

@SpringBootTest
class CarSalesPortalApplicationTests {


    @Mock
    private WebUserRepository userRepo;
    @Mock
    private CarsRepository carRepository;
    @InjectMocks
    private WebService userService;
    
    @Test
    public void testRegistration() {

        WebUser user = new WebUser();
        user.setEmail("Adi@gmail.com");
        user.setName("Adi");
        user.setPassword("123");
        user.setRole("ROLE_USER");
        when(userRepo.save(any(WebUser.class))).thenReturn(user);
        boolean result = userService.addUser(user);
        
        assertTrue(result);
    }
    
    @Test
    public void testLogin() {
        WebUser existedUser = new WebUser();
        existedUser.setEmail("Adi@gmail.com");
        existedUser.setName("Adi");
        existedUser.setPassword("123");
        existedUser.setRole("ROLE_USER");
        
        assertTrue("Adi".equals(existedUser.getName()));
        assertTrue("123".equals(existedUser.getPassword()));
    }
    
    @Test
    public void testSearchCars() {
        List<Cars> cars = new ArrayList<>();
        Cars car1 = new Cars(1,"Toyota", "Corolla", 2015, 1000);
        Cars car2 = new Cars(2,"Honda", "Accord", 2016, 2000);
        Cars car3 = new Cars(3,"Ford", "Mustang", 2017, 3000);
        cars.add(car1);
        cars.add(car2);
        cars.add(car3);

        when(carRepository.findByKeyword(anyString())).thenReturn(cars);        
        List<Cars> searchResults = userService.search("Toyota");        
        verify(carRepository).findByKeyword("Toyota");

        assertEquals(searchResults.get(0), car1);
    }
    
    @Test
    public void viewAllCars() {
        List<Cars> cars = new ArrayList<>();
        Cars car1 = new Cars(1,"Toyota", "Corolla", 2015, 1000);
        Cars car2 = new Cars(2,"Honda", "Accord", 2016, 2000);
        Cars car3 = new Cars(3,"Ford", "Mustang", 2017, 3000);
        cars.add(car1);
        cars.add(car2);
        cars.add(car3);

        when(carRepository.findAll()).thenReturn(cars);
        List<Cars> searchResults = carRepository.findAll();

        assertEquals(searchResults.size(), 3);
    }
    @Test
    public void testPostACar() {
        Cars car1 = new Cars(1,"Toyota", "Corolla", 2015, 1000);
        

        when(carRepository.save(any(Cars.class))).thenReturn(car1);
        Cars result = userService.addCar(car1);
        
        assertNotNull(result);
    }
}
