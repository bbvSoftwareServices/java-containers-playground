package eu.bbv.javacontainers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.Map;

@RestController
public class GreetingController {

    @GetMapping("/greeting")
    public Map<String, String> greeting() {
        return Map.of("message", "hello from Spring Boot at " + Instant.now());
    }
}
