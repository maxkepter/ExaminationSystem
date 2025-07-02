package utils;

import java.util.List;

public class PagingList {
    @SuppressWarnings("rawtypes")
    public static List paging(List list, int pageIndex, int maxPage, int pageSize) throws IndexOutOfBoundsException {
        if (maxPage < pageIndex) {
            throw new IndexOutOfBoundsException("Page does not exist !");
        }

        int start = pageIndex * pageSize;
        int end = (pageIndex + 1) * pageSize < list.size() - 1 ? (pageIndex + 1) * pageSize
                : list.size();

        List subList = list.subList(start, end);
        return subList;
    }
}
