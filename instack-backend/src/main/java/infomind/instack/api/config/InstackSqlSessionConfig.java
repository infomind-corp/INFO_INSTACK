package infomind.instack.api.config;

import jakarta.annotation.PostConstruct;
import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;
import org.egovframe.rte.psl.dataaccess.mapper.MapperConfigurer;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
public class InstackSqlSessionConfig {

    private final DataSource dataSource;
    private final Environment env;

    public InstackSqlSessionConfig(DataSource dataSource, Environment env) {
        this.dataSource = dataSource;
        this.env = env;
    }

    private String dbType;

    @PostConstruct
    void init() {
        dbType = env.getProperty("Globals.DbType");
    }

    @Bean(name = {"instackSqlSession", "instack.sqlSession"})
    public SqlSessionFactoryBean instackSqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);

        PathMatchingResourcePatternResolver pathMatchingResourcePatternResolver = new PathMatchingResourcePatternResolver();

        sqlSessionFactoryBean.setConfigLocation(
            pathMatchingResourcePatternResolver
                .getResource("classpath:/egovframework/mapper/config/mapper-config.xml"));

        try {
            Resource[] resources = pathMatchingResourcePatternResolver.getResources(
                    "classpath:/infomind/instack/api/**/mapper/" + dbType + "/*_" + dbType + ".xml"
            );
            sqlSessionFactoryBean.setMapperLocations(resources);
        } catch (IOException e) {
            /// TODO Exception 처리 필요
        }

        return sqlSessionFactoryBean;
    }

    @Bean
    static MapperConfigurer instackMapperConfigurer() {
        MapperConfigurer mapperConfigurer = new MapperConfigurer();
        mapperConfigurer.setBasePackage("infomind.instack.api");
        mapperConfigurer.setAnnotationClass(EgovMapper.class);
        mapperConfigurer.setSqlSessionFactoryBeanName("instackSqlSession");
        return mapperConfigurer;
    }
}