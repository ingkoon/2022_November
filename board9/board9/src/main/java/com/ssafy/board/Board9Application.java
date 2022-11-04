package com.ssafy.board;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.ssafy"})
public class Board9Application {

	public static void main(String[] args) {
		SpringApplication.run(Board9Application.class, args);
	}

}
