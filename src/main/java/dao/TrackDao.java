package dao;

import models.Track;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class TrackDao {

    public static void update(Track test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Track test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }
    public static Track findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Track auu = session.get(Track.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
//        String hql = "delete from Track where track_id = :id";
//        session.createQuery(hql).setParameter("id", idd).executeUpdate();
        Track track = new Track();
        track.setTrack_id(idd);
        session.remove(track);
        tx1.commit();
        session.close();
    }

    public static List<Track> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Track")
                .list();
    }
}
