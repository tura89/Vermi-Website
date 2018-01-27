package Vermi.manager;

import Vermi.model.Admin;

public interface AdminManager {
    Admin getAdmin(Integer id);

    Admin getAdmin(String name);

    boolean adminUsernameExists(String name);

    boolean createNewAdmin(Admin admin);

    boolean removeAdmin(Admin admin);

    boolean isCorrectPassword(Admin admin, String hashedPassword);

}
