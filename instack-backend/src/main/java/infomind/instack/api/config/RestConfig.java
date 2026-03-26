package infomind.instack.api.config;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.client.HttpComponentsClientHttpRequestFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
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
        return restTemplateBuilder
                .setClientRequestFactoryBuilder(
                    new HttpComponentsClientHttpRequestFactoryBuilder()
                        .withConnectTimeout(Duration.ofMillis(3000))
                        .withReadTimeout(Duration.ofMillis(3000))
                )
                .build();
    }
}
