package service.admin;

import java.util.List;

import constants.PageSize;
import factory.DAOFactory;
import model.user.User;
import utils.PagingList;

public class ViewUserService {

    public List<User> getUser(int pageIndex, int[] maxPage) throws IndexOutOfBoundsException {
        List<User> users = DAOFactory.getUserDao().findAll();
        int pageSize = PageSize.USER;
        // get maxPage
        maxPage[0] = (users.size() / pageSize);

        return PagingList.paging(users, pageIndex, maxPage[0], pageSize);
    }

}
