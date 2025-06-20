package utils;

public class CalculatePage {
    // pageIndex - 0-index
    // page[0] start
    // page[1] end
    public static int getStrat(int pageIndex, int pageSize) {
        return pageIndex * pageSize;
    }
}
