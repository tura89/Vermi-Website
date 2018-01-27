package Vermi.manager;

import Vermi.model.Item;

import java.util.List;

public interface NewsManager {
    Item getNews(Integer id);

    void createNews(Item news);

    void deleteNews(Integer id);

    List<Item> getAllNews();
}
