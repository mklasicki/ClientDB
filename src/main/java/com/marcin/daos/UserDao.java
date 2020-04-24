package com.marcin.daos;

import com.marcin.domain.User;

public interface UserDao {

    void saveUser(User newUser);

    User findUserById(long id);

    User findUserByName(String username);

}
