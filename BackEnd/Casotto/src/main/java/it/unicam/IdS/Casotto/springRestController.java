package it.unicam.IdS.Casotto;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})

@RestController
public class springRestController {
    @GetMapping("/connect")
    public void connect(){
        System.out.println("Spring Boot Application Connected.");
    }

}
