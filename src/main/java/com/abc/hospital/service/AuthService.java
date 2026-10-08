package com.abc.hospital.service;

import com.abc.hospital.dao.UserDao;
import com.abc.hospital.entity.UserAccount;

public class AuthService {
    private final UserDao dao = new UserDao();

    public void initialize() {
        dao.createDefaultAdminIfMissing();
    }

    public UserAccount login(String username, String password) {
        return dao.authenticate(username, password);
    }
}
