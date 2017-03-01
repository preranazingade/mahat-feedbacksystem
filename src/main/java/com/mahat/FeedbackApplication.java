package com.mahat;
import com.mahat.entity.*;
import java.util.List;
import java.util.Arrays;
import java.util.stream.Stream;
import org.springframework.boot.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;


@SpringBootApplication
public class FeedbackApplication {

        @Bean
	CommandLineRunner commandLineRunner(FeedbackInterface feedbackRepository) {
		return arg0 -> {
                    //asList(new Feedback());
                                                List<Feedback> feedbacks = Arrays.asList(new Feedback("Prerana","good"),new Feedback("Prachi" ,"cute"));
                                                feedbackRepository.save(feedbacks);
				                Stream.of(feedbackRepository.findAll()).forEach(System.out::println);
		};
	}
	public static void main(String[] args) {
		SpringApplication.run(FeedbackApplication.class, args);
	}
}
