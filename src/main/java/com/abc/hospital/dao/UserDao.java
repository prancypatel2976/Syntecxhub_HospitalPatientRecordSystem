package com.abc.hospital.dao;

import com.abc.hospital.entity.UserAccount;
import com.abc.hospital.util.HibernateUtil;
import com.abc.hospital.util.PasswordUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDao {
    public void createDefaultAdminIfMissing() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            UserAccount user = session.createQuery(
                    "from UserAccount where username = :username", UserAccount.class)
                    .setParameter("username", "admin")
                    .uniqueResult();

            if (user == null) {
                Transaction tx = session.beginTransaction();
                session.persist(new UserAccount("admin", PasswordUtil.hash("Admin@123"), "ADMIN"));
                tx.commit();
            }
        }
    }

    public UserAccount authenticate(String username, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            UserAccount user = session.createQuery(
                    "from UserAccount where username = :username", UserAccount.class)
                    .setParameter("username", username)
                    .uniqueResult();

            if (user != null && user.getPasswordHash().equals(PasswordUtil.hash(password))) {
                return user;
            }
            return null;
        }
    }
}
