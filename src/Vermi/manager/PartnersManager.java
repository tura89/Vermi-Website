package Vermi.manager;

import Vermi.model.Item;

import java.util.List;

public interface PartnersManager {
    Item getPartner(Integer id);

    void createPartner(Item news);

    void deletePartner(Integer id);

    List<Item> getAllPartners();
}
