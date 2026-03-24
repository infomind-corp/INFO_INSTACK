package infomind.instack.api.common.model;

import lombok.Getter;

import java.util.List;

/**
 * 페이징 응답 래퍼 클래스.
 * <p>목록({@code list}), 전체 건수({@code total}), 현재 페이지({@code page}), 페이지 크기({@code size})를 포함한다.</p>
 */
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
