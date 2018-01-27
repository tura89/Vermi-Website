package Vermi.manager;

import Vermi.model.Item;

import java.util.List;

public interface MiscManager {
    Item getMisc(Integer id);

    void createMisc(Item news);

    void deleteMisc(Integer id);

    List<Item> getAllMisc();
}
