package Vermi.model;

import java.sql.Timestamp;
import java.util.Date;

public class Item {
    private Integer dataType;
    private int displayWeight;
    private boolean isPublic;
    private String createdDate;
    private String modifiedDate;
    private String deletedDate;
    private Integer ID;

    private String title_ge;
    private String intro_ge;
    private String content_ge;
    private String keywords_ge;
    private String description_ge;

    private String title_rus;
    private String intro_rus;
    private String content_rus;
    private String keywords_rus;
    private String description_rus;

    private String title_eng;
    private String intro_eng;
    private String content_eng;
    private String keywords_eng;
    private String description_eng;

    public void setDataType(Integer dataType) {
        this.dataType = dataType;
    }

    public void setDisplayWeight(int displayWeight) {
        this.displayWeight = displayWeight;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public void setDeletedDate(String deletedDate) {
        this.deletedDate = deletedDate;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public void setTitle_ge(String title_ge) {
        this.title_ge = title_ge;
    }

    public void setIntro_ge(String intro_ge) {
        this.intro_ge = intro_ge;
    }

    public void setContent_ge(String content_ge) {
        this.content_ge = content_ge;
    }

    public void setKeywords_ge(String keywords_ge) {
        this.keywords_ge = keywords_ge;
    }

    public void setDescription_ge(String description_ge) {
        this.description_ge = description_ge;
    }

    public void setTitle_rus(String title_rus) {
        this.title_rus = title_rus;
    }

    public void setIntro_rus(String intro_rus) {
        this.intro_rus = intro_rus;
    }

    public void setContent_rus(String content_rus) {
        this.content_rus = content_rus;
    }

    public void setKeywords_rus(String keywords_rus) {
        this.keywords_rus = keywords_rus;
    }

    public void setDescription_rus(String description_rus) {
        this.description_rus = description_rus;
    }

    public void setTitle_eng(String title_eng) {
        this.title_eng = title_eng;
    }

    public void setIntro_eng(String intro_eng) {
        this.intro_eng = intro_eng;
    }

    public void setContent_eng(String content_eng) {
        this.content_eng = content_eng;
    }

    public void setKeywords_eng(String keywords_eng) {
        this.keywords_eng = keywords_eng;
    }

    public void setDescription_eng(String description_eng) {
        this.description_eng = description_eng;
    }

    public Item(Integer id, int displayweight, boolean isPublic, String createdDate,
                String title_ge, String intro_ge, String content_ge, String keywords_ge, String description_ge,
                String title_rus, String intro_rus, String content_rus, String keywords_rus, String description_rus,
                String title_eng, String intro_eng, String content_eng, String keywords_eng, String description_eng,
                Integer type){
        this.ID = id;
        this.displayWeight = displayweight;
        this.isPublic = isPublic;
        this.createdDate = createdDate;

        this.title_ge = title_ge;
        this.intro_ge = intro_ge;
        this.content_ge = content_ge;
        this.keywords_ge = keywords_ge;
        this.description_ge = description_ge;

        this.title_rus = title_rus;
        this.intro_rus = intro_rus;
        this.content_rus = content_rus;
        this.keywords_rus = keywords_rus;
        this.description_rus = description_rus;

        this.title_eng = title_eng;
        this.intro_eng = intro_eng;
        this.content_eng = content_eng;
        this.keywords_eng = keywords_eng ;
        this.description_eng = description_eng;

        this.dataType = type;
    }

    public Item(int displayweight, boolean isPublic, String createdDate,
                String title_ge, String intro_ge, String content_ge, String keywords_ge, String description_ge,
                String title_rus, String intro_rus, String content_rus, String keywords_rus, String description_rus,
                String title_eng, String intro_eng, String content_eng, String keywords_eng, String description_eng, Integer type){
        this(null, displayweight, isPublic, createdDate,
                title_ge, intro_ge, content_ge, keywords_ge, description_ge,
                title_rus, intro_rus, content_rus, keywords_rus, description_rus,
                title_eng, intro_eng, content_eng, keywords_eng, description_eng, type);
    }

    public Item(int displayweight, boolean isPublic, String createdDate,
                String title_ge, String intro_ge, String content_ge, String keywords_ge, String description_ge,
                String title_rus, String intro_rus, String content_rus, String keywords_rus, String description_rus,
                String title_eng, String intro_eng, String content_eng, String keywords_eng, String description_eng){
        this(null, displayweight, isPublic, createdDate,
                title_ge, intro_ge, content_ge, keywords_ge, description_ge,
                title_rus, intro_rus, content_rus, keywords_rus, description_rus,
                title_eng, intro_eng, content_eng, keywords_eng, description_eng, -1);
    }

    public Item() {
    }

    public int getWeight() {
        return displayWeight;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public String getDeletedDate() {
        return deletedDate;
    }

    public Integer getID() {
        return ID;
    }

    public String getTitle_ge() {
        return title_ge;
    }

    public String getIntro_ge() {
        return intro_ge;
    }

    public String getContent_ge() {
        return content_ge;
    }

    public String getKeywords_ge() {
        return keywords_ge;
    }

    public String getDescription_ge() {
        return description_ge;
    }

    public String getTitle_rus() {
        return title_rus;
    }

    public String getIntro_rus() {
        return intro_rus;
    }

    public String getContent_rus() {
        return content_rus;
    }

    public String getKeywords_rus() {
        return keywords_rus;
    }

    public String getDescription_rus() {
        return description_rus;
    }

    public String getTitle_eng() {
        return title_eng;
    }

    public String getIntro_eng() {
        return intro_eng;
    }

    public String getContent_eng() {
        return content_eng;
    }

    public String getKeywords_eng() {
        return keywords_eng;
    }

    public String getDescription_eng() {
        return description_eng;
    }

    public int getType() {
        return dataType;
    }

    public String toString(){
        return "ID: " + ID + "\n" +
               "displayWeight: " + displayWeight + "</br>" +
               "Is it Public?: " + isPublic + "</br>" +
               "Date created: " + createdDate + "</br>" +
               "Title: " + title_ge + "</br>" +
               "Content: " + content_ge + "</br>";
    }
}
