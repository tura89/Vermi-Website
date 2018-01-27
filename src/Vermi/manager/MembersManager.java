package Vermi.manager;

import Vermi.model.Item;

import java.util.List;

public interface MembersManager {
    Item getMember(Integer id);

    void createMember(Item news);

    void deleteMember(Integer id);

    List<Item> getAllMembers();
}
