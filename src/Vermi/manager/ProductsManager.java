package Vermi.manager;

import Vermi.model.Item;

import java.util.List;

public interface ProductsManager {
    Item getProduct(Integer id);

    void createProduct(Item news);

    void deleteProduct(Integer id);

    List<Item> getAllProducts();
}
