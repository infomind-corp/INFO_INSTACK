package infomind.instack.api.common.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageRequest {

    private int page = 1;
    private int size = 10;
    private String searchType;
    private String searchKeyword;

    public int getOffset() {
        return (page - 1) * size;
    }
}