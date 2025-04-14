package com.example.diploma;
import com.example.diploma.controllers.ProductController;
import com.example.diploma.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
//@WebMvcTest(UserController.class)
//@TestPropertySource("/resources/application-test.properties")
class CursachApplicationTests {
	@Autowired
	private ProductController controller;
	@Autowired
	private MockMvc mockMvc;
	@Autowired
	UserRepository repository;
	@Test
	public void shouldReturnDefaultMessage() throws Exception {
		this.mockMvc.perform(get("/"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(content().string(containsString("BarberShop")));
	}
	@Test
	public void accessDeniedTest() throws Exception{
		this.mockMvc.perform(get("/profile"))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("http://localhost/login"));
	}
	@Test
	public void correctLoginTest() throws Exception{
		this.mockMvc.perform(SecurityMockMvcRequestBuilders.formLogin().user("marat_gadzhiev_2003@mail.ru").password("123"))
				.andDo(print())
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("/"));
	}
	@WithUserDetails("marat_gadzhiev_2003@mail.ru")
	@Test
	public void productListTest() throws Exception{
		this.mockMvc.perform(get("/"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(authenticated())
				.andExpect(xpath("//div[@id=\"products\"]/div").exists());
	}
}
