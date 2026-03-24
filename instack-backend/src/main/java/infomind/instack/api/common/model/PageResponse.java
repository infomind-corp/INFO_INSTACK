package infomind.instack.api.common.model;

import lombok.Getter;

import java.util.List;

@Getter
public class PageResponse<T> {

    private final List<T> list;
    private final int total;
    private final int page;
    private final int size;

    public PageResponse(List<T> list, int total, PageRequest pageRequest) {
        this.list = list;
        this.total = total;
        this.page = pageRequest.getPage();
        this.size = pageRequest.getSize();
    }
}
