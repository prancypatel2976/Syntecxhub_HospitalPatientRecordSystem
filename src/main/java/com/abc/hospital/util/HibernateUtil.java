package com.abc.hospital.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public final class HibernateUtil {
    private static final SessionFactory FACTORY = buildFactory();

    private HibernateUtil() {}

    private static SessionFactory buildFactory() {
        try {
            return new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            throw new ExceptionInInitializerError("Hibernate startup failed: " + e.getMessage());
        }
    }

    public static SessionFactory getSessionFactory() {
        return FACTORY;
    }

    public static void shutdown() {
        if (FACTORY != null) FACTORY.close();
    }
}
