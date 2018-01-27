package Vermi.manager.dao;


import Vermi.manager.AdminManager;
import Vermi.manager.dao.db.DbContract;
import Vermi.model.Admin;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminManagerDAO extends AbstractManagerDAO implements AdminManager {

    public static final String ATTRIBUTE_NAME = "admin_manager";

    public AdminManagerDAO(DataSource dataSource) {
        super(dataSource);
    }


    @Override
    public Admin getAdmin(Integer id) {
        Admin admin = null;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Admins.TABLE_NAME + " WHERE "
                    + DbContract.Admins.COLUMN_NAME_ADMIN_ID + " = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()){
                String username = rs.getString(DbContract.Admins.COLUMN_NAME_USERNAME);
                String hashedPassword = rs.getString(DbContract.Admins.COLUMN_NAME_HASHED_PASSWORD);
                admin = new Admin(id, username, hashedPassword);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    @Override
    public Admin getAdmin(String name) {
        Admin admin = null;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Admins.TABLE_NAME + " WHERE "
                    + DbContract.Admins.COLUMN_NAME_USERNAME + " = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();

            if (rs.next()){
                String username = rs.getString(DbContract.Admins.COLUMN_NAME_USERNAME);
                int id = rs.getInt(DbContract.Admins.COLUMN_NAME_ADMIN_ID);
                String hashedPassword = rs.getString(DbContract.Admins.COLUMN_NAME_HASHED_PASSWORD);

                admin = new Admin(id, username, hashedPassword);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    @Override
    public boolean adminUsernameExists(String name) {
        boolean exists = false;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Admins.TABLE_NAME + " WHERE " +
                    DbContract.Admins.COLUMN_NAME_USERNAME + " = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, name);

            ResultSet result = statement.executeQuery();
            exists = result.next();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    @Override
    public boolean createNewAdmin(Admin admin) {
        if (admin.getUsername() == null || admin.getHashedPassword() == null)
            return false;

        if (adminUsernameExists(admin.getUsername()))
            return false;

        try{
            Connection con = dataSource.getConnection();
            String query = "INSERT INTO " + DbContract.Admins.TABLE_NAME + " (" +
                    DbContract.Admins.COLUMN_NAME_USERNAME + ", " +
                    DbContract.Admins.COLUMN_NAME_HASHED_PASSWORD + ") VALUES (?, ?);";
            PreparedStatement statement = con.prepareStatement(query);

            statement.setString(1, admin.getUsername());
            statement.setString(2, admin.getHashedPassword());
            statement.executeUpdate();

            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean removeAdmin(Admin admin) {
        return false;
    }

    @Override
    public boolean isCorrectPassword(Admin admin, String hashedPassword) {
        if(hashedPassword.equals(admin.getHashedPassword()))
            return true;
        return false;
    }
}
