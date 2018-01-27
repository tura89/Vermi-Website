package Vermi.manager.dao.db;


public final class DbContract {

    public DbContract() {

    }

    public abstract static class Admins{
        public static final String TABLE_NAME = "admins";
        public static final String COLUMN_NAME_USERNAME = "username";
        public static final String COLUMN_NAME_ADMIN_ID = "id";
        public static final String COLUMN_NAME_HASHED_PASSWORD = "hashedPassword";
    }

    public abstract static class News{
        public static final String TABLE_NAME = "news";
        public static final String COLUMN_NAME_DISPLAY_WEIGHT = "DisplayWeight";
        public static final String COLUMN_NAME_NEWS_ID = "PK_news_ID";
        public static final String COLUMN_NAME_IS_PUBLIC = "IsPublic";
        public static final String COLUMN_NAME_CREATED_DATE = "CreatedDate";
        public static final String COLUMN_NAME_MODIFIED_DATE = "ModifiedDate";
        public static final String COLUMN_NAME_DELETED_DATE = "DeletedDate";
        public static final String COLUMN_NAME_IS_DELETED = "IsDeleted";

        public static final String COLUMN_NAME_TITLE_GE = "Title_ge";
        public static final String COLUMN_NAME_INTRO_GE = "Intro_ge";
        public static final String COLUMN_NAME_CONTENT_GE = "Content_ge";
        public static final String COLUMN_NAME_KEYWORDS_GE = "Keywords_ge";
        public static final String COLUMN_NAME_DESCRIPTION_GE = "Description_ge";

        public static final String COLUMN_NAME_TITLE_RUS = "Title_rus";
        public static final String COLUMN_NAME_INTRO_RUS = "Intro_rus";
        public static final String COLUMN_NAME_CONTENT_RUS = "Content_rus";
        public static final String COLUMN_NAME_KEYWORDS_RUS = "Keywords_rus";
        public static final String COLUMN_NAME_DESCRIPTION_RUS = "Description_rus";

        public static final String COLUMN_NAME_TITLE_ENG = "Title_eng";
        public static final String COLUMN_NAME_INTRO_ENG = "Intro_eng";
        public static final String COLUMN_NAME_CONTENT_ENG = "Content_eng";
        public static final String COLUMN_NAME_KEYWORDS_ENG = "Keywords_eng";
        public static final String COLUMN_NAME_DESCRIPTION_ENG = "Description_eng";

    }

    public abstract static class Members{
        public static final String TABLE_NAME = "members";
        public static final String COLUMN_NAME_DISPLAY_WEIGHT = "DisplayWeight";
        public static final String COLUMN_NAME_NEWS_ID = "PK_member_ID";
        public static final String COLUMN_NAME_IS_PUBLIC = "IsPublic";
        public static final String COLUMN_NAME_CREATED_DATE = "CreatedDate";
        public static final String COLUMN_NAME_MODIFIED_DATE = "ModifiedDate";
        public static final String COLUMN_NAME_DELETED_DATE = "DeletedDate";
        public static final String COLUMN_NAME_IS_DELETED = "IsDeleted";

        public static final String COLUMN_NAME_TITLE_GE = "Title_ge";
        public static final String COLUMN_NAME_INTRO_GE = "Intro_ge";
        public static final String COLUMN_NAME_CONTENT_GE = "Content_ge";
        public static final String COLUMN_NAME_KEYWORDS_GE = "Keywords_ge";
        public static final String COLUMN_NAME_DESCRIPTION_GE = "Description_ge";

        public static final String COLUMN_NAME_TITLE_RUS = "Title_rus";
        public static final String COLUMN_NAME_INTRO_RUS = "Intro_rus";
        public static final String COLUMN_NAME_CONTENT_RUS = "Content_rus";
        public static final String COLUMN_NAME_KEYWORDS_RUS = "Keywords_rus";
        public static final String COLUMN_NAME_DESCRIPTION_RUS = "Description_rus";

        public static final String COLUMN_NAME_TITLE_ENG = "Title_eng";
        public static final String COLUMN_NAME_INTRO_ENG = "Intro_eng";
        public static final String COLUMN_NAME_CONTENT_ENG = "Content_eng";
        public static final String COLUMN_NAME_KEYWORDS_ENG = "Keywords_eng";
        public static final String COLUMN_NAME_DESCRIPTION_ENG = "Description_eng";

    }

    public abstract static class Misc{
        public static final String TABLE_NAME = "misc";
        public static final String COLUMN_NAME_DISPLAY_WEIGHT = "DisplayWeight";
        public static final String COLUMN_NAME_NEWS_ID = "PK_misc_ID";
        public static final String COLUMN_NAME_IS_PUBLIC = "IsPublic";
        public static final String COLUMN_NAME_CREATED_DATE = "CreatedDate";
        public static final String COLUMN_NAME_MODIFIED_DATE = "ModifiedDate";
        public static final String COLUMN_NAME_DELETED_DATE = "DeletedDate";
        public static final String COLUMN_NAME_IS_DELETED = "IsDeleted";

        public static final String COLUMN_NAME_TITLE_GE = "Title_ge";
        public static final String COLUMN_NAME_INTRO_GE = "Intro_ge";
        public static final String COLUMN_NAME_CONTENT_GE = "Content_ge";
        public static final String COLUMN_NAME_KEYWORDS_GE = "Keywords_ge";
        public static final String COLUMN_NAME_DESCRIPTION_GE = "Description_ge";

        public static final String COLUMN_NAME_TITLE_RUS = "Title_rus";
        public static final String COLUMN_NAME_INTRO_RUS = "Intro_rus";
        public static final String COLUMN_NAME_CONTENT_RUS = "Content_rus";
        public static final String COLUMN_NAME_KEYWORDS_RUS = "Keywords_rus";
        public static final String COLUMN_NAME_DESCRIPTION_RUS = "Description_rus";

        public static final String COLUMN_NAME_TITLE_ENG = "Title_eng";
        public static final String COLUMN_NAME_INTRO_ENG = "Intro_eng";
        public static final String COLUMN_NAME_CONTENT_ENG = "Content_eng";
        public static final String COLUMN_NAME_KEYWORDS_ENG = "Keywords_eng";
        public static final String COLUMN_NAME_DESCRIPTION_ENG = "Description_eng";

        public static final String COLUMN_NAME_TYPE = "DataType";
    }

    public abstract static class Products{
        public static final String TABLE_NAME = "products";
        public static final String COLUMN_NAME_DISPLAY_WEIGHT = "DisplayWeight";
        public static final String COLUMN_NAME_NEWS_ID = "PK_products_ID";
        public static final String COLUMN_NAME_IS_PUBLIC = "IsPublic";
        public static final String COLUMN_NAME_CREATED_DATE = "CreatedDate";
        public static final String COLUMN_NAME_MODIFIED_DATE = "ModifiedDate";
        public static final String COLUMN_NAME_DELETED_DATE = "DeletedDate";
        public static final String COLUMN_NAME_IS_DELETED = "IsDeleted";


        public static final String COLUMN_NAME_TITLE_GE = "Title_ge";
        public static final String COLUMN_NAME_INTRO_GE = "Intro_ge";
        public static final String COLUMN_NAME_CONTENT_GE = "Content_ge";
        public static final String COLUMN_NAME_KEYWORDS_GE = "Keywords_ge";
        public static final String COLUMN_NAME_DESCRIPTION_GE = "Description_ge";

        public static final String COLUMN_NAME_TITLE_RUS = "Title_rus";
        public static final String COLUMN_NAME_INTRO_RUS = "Intro_rus";
        public static final String COLUMN_NAME_CONTENT_RUS = "Content_rus";
        public static final String COLUMN_NAME_KEYWORDS_RUS = "Keywords_rus";
        public static final String COLUMN_NAME_DESCRIPTION_RUS = "Description_rus";

        public static final String COLUMN_NAME_TITLE_ENG = "Title_eng";
        public static final String COLUMN_NAME_INTRO_ENG = "Intro_eng";
        public static final String COLUMN_NAME_CONTENT_ENG = "Content_eng";
        public static final String COLUMN_NAME_KEYWORDS_ENG = "Keywords_eng";
        public static final String COLUMN_NAME_DESCRIPTION_ENG = "Description_eng";

    }

    public abstract static class Partners{
        public static final String TABLE_NAME = "partners";
        public static final String COLUMN_NAME_DISPLAY_WEIGHT = "DisplayWeight";
        public static final String COLUMN_NAME_NEWS_ID = "PK_partners_ID";
        public static final String COLUMN_NAME_IS_PUBLIC = "IsPublic";
        public static final String COLUMN_NAME_CREATED_DATE = "CreatedDate";
        public static final String COLUMN_NAME_MODIFIED_DATE = "ModifiedDate";
        public static final String COLUMN_NAME_DELETED_DATE = "DeletedDate";
        public static final String COLUMN_NAME_IS_DELETED = "IsDeleted";


        public static final String COLUMN_NAME_TITLE_GE = "Title_ge";
        public static final String COLUMN_NAME_INTRO_GE = "Intro_ge";
        public static final String COLUMN_NAME_CONTENT_GE = "Content_ge";
        public static final String COLUMN_NAME_KEYWORDS_GE = "Keywords_ge";
        public static final String COLUMN_NAME_DESCRIPTION_GE = "Description_ge";

        public static final String COLUMN_NAME_TITLE_RUS = "Title_rus";
        public static final String COLUMN_NAME_INTRO_RUS = "Intro_rus";
        public static final String COLUMN_NAME_CONTENT_RUS = "Content_rus";
        public static final String COLUMN_NAME_KEYWORDS_RUS = "Keywords_rus";
        public static final String COLUMN_NAME_DESCRIPTION_RUS = "Description_rus";

        public static final String COLUMN_NAME_TITLE_ENG = "Title_eng";
        public static final String COLUMN_NAME_INTRO_ENG = "Intro_eng";
        public static final String COLUMN_NAME_CONTENT_ENG = "Content_eng";
        public static final String COLUMN_NAME_KEYWORDS_ENG = "Keywords_eng";
        public static final String COLUMN_NAME_DESCRIPTION_ENG = "Description_eng";

    }

}
