package Vermi.manager.dao;

import Vermi.manager.NewsManager;
import Vermi.manager.PartnersManager;
import Vermi.manager.dao.db.DbContract;
import Vermi.model.Item;

import javax.servlet.http.Part;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PartnersManagerDAO extends AbstractManagerDAO  implements PartnersManager{
    private int displayWeight;
    private Connection con;

    public PartnersManagerDAO(DataSource dataSource) {
        super(dataSource);
    }

    public static final String ATTRIBUTE_NAME = "partner_manager";

    @Override
    public Item getPartner(Integer id) {
        Item news = null;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Partners.TABLE_NAME + " WHERE "
                    + DbContract.Partners.COLUMN_NAME_NEWS_ID + " = ?;";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()){
                int displayWeight = rs.getInt(DbContract.Partners.COLUMN_NAME_DISPLAY_WEIGHT);
                int ID = rs.getInt(DbContract.Partners.COLUMN_NAME_NEWS_ID);
                boolean isPublic = rs.getBoolean(DbContract.Partners.COLUMN_NAME_IS_PUBLIC);
                String dateCreated = rs.getString(DbContract.Partners.COLUMN_NAME_CREATED_DATE);

                String content_ge = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_GE);
                String title_ge = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_GE);
                String intro_ge = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_GE);
                String description_ge = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_GE);
                String keywords_ge = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_GE);

                String content_rus = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_RUS);
                String title_rus = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_RUS);
                String intro_rus = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_RUS);
                String description_rus = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_RUS);
                String keywords_rus = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_RUS);

                String content_eng = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_ENG);
                String title_eng = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_ENG);
                String intro_eng = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_ENG);
                String description_eng = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_ENG);
                String keywords_eng = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_ENG);

                news = new Item(ID, displayWeight, isPublic, dateCreated,
                        title_ge, intro_ge, content_ge, keywords_ge, description_ge,
                        title_rus, intro_rus, content_rus, keywords_rus, description_rus,
                        title_eng, intro_eng, content_eng, keywords_eng, description_eng, -1);            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    @Override
    public void createPartner(Item news) {
        try {
            Connection con = dataSource.getConnection();
            String query = "INSERT INTO " + DbContract.Partners.TABLE_NAME + " (" +
                    DbContract.Partners.COLUMN_NAME_DISPLAY_WEIGHT + ", " +
                    DbContract.Partners.COLUMN_NAME_IS_PUBLIC + ", " +

                    DbContract.Partners.COLUMN_NAME_CREATED_DATE + ", " +
                    DbContract.Partners.COLUMN_NAME_MODIFIED_DATE + ", " +
                    DbContract.Partners.COLUMN_NAME_DELETED_DATE + ", " +

                    DbContract.Partners.COLUMN_NAME_TITLE_GE + ", " +
                    DbContract.Partners.COLUMN_NAME_INTRO_GE + ", " +
                    DbContract.Partners.COLUMN_NAME_CONTENT_GE + ", " +
                    DbContract.Partners.COLUMN_NAME_KEYWORDS_GE + ", " +
                    DbContract.Partners.COLUMN_NAME_DESCRIPTION_GE + ", " +

                    DbContract.Partners.COLUMN_NAME_TITLE_RUS + ", " +
                    DbContract.Partners.COLUMN_NAME_INTRO_RUS + ", " +
                    DbContract.Partners.COLUMN_NAME_CONTENT_RUS + ", " +
                    DbContract.Partners.COLUMN_NAME_KEYWORDS_RUS + ", " +
                    DbContract.Partners.COLUMN_NAME_DESCRIPTION_RUS + ", " +

                    DbContract.Partners.COLUMN_NAME_TITLE_ENG + ", " +
                    DbContract.Partners.COLUMN_NAME_INTRO_ENG + ", " +
                    DbContract.Partners.COLUMN_NAME_CONTENT_ENG + ", " +
                    DbContract.Partners.COLUMN_NAME_KEYWORDS_ENG + ", " +
                    DbContract.Partners.COLUMN_NAME_DESCRIPTION_ENG + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
            PreparedStatement statement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, news.getWeight());
            statement.setBoolean(2, news.isPublic());
            statement.setString(3, String.valueOf(news.getCreatedDate()));
            statement.setString(4, String.valueOf(news.getModifiedDate()));
            statement.setString(5, String.valueOf(news.getDeletedDate()));

            statement.setString(6, news.getTitle_ge());
            statement.setString(7, news.getIntro_ge());
            statement.setString(8, news.getContent_ge());
            statement.setString(9, news.getKeywords_ge());
            statement.setString(10, news.getDescription_ge());

            statement.setString(11, news.getTitle_rus());
            statement.setString(12, news.getIntro_rus());
            statement.setString(13, news.getContent_rus());
            statement.setString(14, news.getKeywords_rus());
            statement.setString(15, news.getDescription_rus());

            statement.setString(16, news.getTitle_eng());
            statement.setString(17, news.getIntro_eng());
            statement.setString(18, news.getContent_eng());
            statement.setString(19, news.getKeywords_eng());
            statement.setString(20, news.getDescription_eng());

            statement.executeUpdate();

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletePartner(Integer id) {
        try {
            Connection con = dataSource.getConnection();
            String query = "DELETE FROM " + DbContract.Partners.TABLE_NAME + " WHERE " + DbContract.Partners.COLUMN_NAME_NEWS_ID + " = " + id;
            PreparedStatement statement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            statement.executeUpdate();
            con.close();
        }  catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Item> getAllPartners() {
        List<Item> partners = new ArrayList<Item>();
        Item partner = null;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Partners.TABLE_NAME +
                    " WHERE " + DbContract.Partners.COLUMN_NAME_IS_DELETED + " = 0 ORDER BY DisplayWeight DESC";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()){
                int displayWeight = rs.getInt(DbContract.Partners.COLUMN_NAME_DISPLAY_WEIGHT);
                int ID = rs.getInt(DbContract.Partners.COLUMN_NAME_NEWS_ID);
                boolean isPublic = rs.getBoolean(DbContract.Partners.COLUMN_NAME_IS_PUBLIC);
                String dateCreated = rs.getString(DbContract.Partners.COLUMN_NAME_CREATED_DATE);

                String content_ge = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_GE);
                String title_ge = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_GE);
                String intro_ge = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_GE);
                String description_ge = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_GE);
                String keywords_ge = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_GE);

                String content_rus = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_RUS);
                String title_rus = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_RUS);
                String intro_rus = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_RUS);
                String description_rus = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_RUS);
                String keywords_rus = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_RUS);

                String content_eng = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_ENG);
                String title_eng = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_ENG);
                String intro_eng = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_ENG);
                String description_eng = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_ENG);
                String keywords_eng = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_ENG);

                partner = new Item(ID, displayWeight, isPublic, dateCreated,
                        title_ge, intro_ge, content_ge, keywords_ge, description_ge,
                        title_rus, intro_rus, content_rus, keywords_rus, description_rus,
                        title_eng, intro_eng, content_eng, keywords_eng, description_eng, -1);

                partners.add(partner);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return partners;
    }

    public List<Item> getAllDeletedPartners() {
        List<Item> partners = new ArrayList<Item>();
        Item partner = null;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Partners.TABLE_NAME +
                    " WHERE " + DbContract.Partners.COLUMN_NAME_IS_DELETED + " = 1 ORDER BY DisplayWeight DESC";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()){
                int displayWeight = rs.getInt(DbContract.Partners.COLUMN_NAME_DISPLAY_WEIGHT);
                int ID = rs.getInt(DbContract.Partners.COLUMN_NAME_NEWS_ID);
                boolean isPublic = rs.getBoolean(DbContract.Partners.COLUMN_NAME_IS_PUBLIC);
                String dateCreated = rs.getString(DbContract.Partners.COLUMN_NAME_CREATED_DATE);

                String content_ge = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_GE);
                String title_ge = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_GE);
                String intro_ge = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_GE);
                String description_ge = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_GE);
                String keywords_ge = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_GE);

                String content_rus = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_RUS);
                String title_rus = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_RUS);
                String intro_rus = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_RUS);
                String description_rus = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_RUS);
                String keywords_rus = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_RUS);

                String content_eng = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_ENG);
                String title_eng = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_ENG);
                String intro_eng = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_ENG);
                String description_eng = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_ENG);
                String keywords_eng = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_ENG);

                partner = new Item(ID, displayWeight, isPublic, dateCreated,
                        title_ge, intro_ge, content_ge, keywords_ge, description_ge,
                        title_rus, intro_rus, content_rus, keywords_rus, description_rus,
                        title_eng, intro_eng, content_eng, keywords_eng, description_eng, -1);

                partners.add(partner);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return partners;
    }

    public List<Item> getAllPublicPartners() {
        List<Item> partners = new ArrayList<Item>();
        Item partner = null;
        try {
            Connection con = dataSource.getConnection();
            String query = "SELECT * FROM " + DbContract.Partners.TABLE_NAME +
                    " WHERE " + DbContract.Partners.COLUMN_NAME_IS_PUBLIC + " = 1 AND "
                    + DbContract.Partners.COLUMN_NAME_IS_DELETED + "= 0 ORDER BY DisplayWeight DESC";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()){
                int displayWeight = rs.getInt(DbContract.Partners.COLUMN_NAME_DISPLAY_WEIGHT);
                int ID = rs.getInt(DbContract.Partners.COLUMN_NAME_NEWS_ID);
                boolean isPublic = rs.getBoolean(DbContract.Partners.COLUMN_NAME_IS_PUBLIC);
                String dateCreated = rs.getString(DbContract.Partners.COLUMN_NAME_CREATED_DATE);

                String content_ge = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_GE);
                String title_ge = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_GE);
                String intro_ge = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_GE);
                String description_ge = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_GE);
                String keywords_ge = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_GE);

                String content_rus = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_RUS);
                String title_rus = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_RUS);
                String intro_rus = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_RUS);
                String description_rus = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_RUS);
                String keywords_rus = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_RUS);

                String content_eng = rs.getString(DbContract.Partners.COLUMN_NAME_CONTENT_ENG);
                String title_eng = rs.getString(DbContract.Partners.COLUMN_NAME_TITLE_ENG);
                String intro_eng = rs.getString(DbContract.Partners.COLUMN_NAME_INTRO_ENG);
                String description_eng = rs.getString(DbContract.Partners.COLUMN_NAME_DESCRIPTION_ENG);
                String keywords_eng = rs.getString(DbContract.Partners.COLUMN_NAME_KEYWORDS_ENG);

                partner = new Item(ID, displayWeight, isPublic, dateCreated,
                        title_ge, intro_ge, content_ge, keywords_ge, description_ge,
                        title_rus, intro_rus, content_rus, keywords_rus, description_rus,
                        title_eng, intro_eng, content_eng, keywords_eng, description_eng, -1);

                partners.add(partner);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return partners;
    }

    public void removePartner(Integer itemId) {
        try {
            Connection con = dataSource.getConnection();
            java.util.Date d = new Date();
            String date = String.valueOf(d);
            String query = "UPDATE " + DbContract.Partners.TABLE_NAME + " SET " + DbContract.Partners.COLUMN_NAME_IS_DELETED +
                    " =  1, " + DbContract.Partners.COLUMN_NAME_DELETED_DATE + " = " + date + " WHERE "
                    + DbContract.Partners.COLUMN_NAME_NEWS_ID + " = " + itemId;
            PreparedStatement statement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            statement.executeUpdate();
            con.close();
        }  catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
