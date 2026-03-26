package infomind.instack.api.config;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.client.HttpComponentsClientHttpRequestFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;

@Configuration
public class RestConfig {

    /**
     * RestTemplate 설정
     * @param restTemplateBuilder RestTemplateBuilder
     * @return [RestTemplate 설정] RestTemplate 등록
     */
    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder restTemplateBuilder) {
            SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
            factory.setConnectTimeout(3000);
            factory.setReadTimeout(3000);
            return new RestTemplate(factory);
    }
}
