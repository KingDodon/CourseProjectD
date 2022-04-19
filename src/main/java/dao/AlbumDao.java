package dao;

import models.Album;
import models.Track;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class AlbumDao {

    public static void update(Album test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Album test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }
    public static Album findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Album auu = session.get(Album.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static int getMaxId(){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        String SQL_QUERY = "select max(album_id)from Album";
        Query query = session.createQuery(SQL_QUERY);
        List list = query.list();
        session.close();
        return (int) list.get(0);
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
//        String hql = "delete from Album where album_id = :id";
//        session.createQuery(hql).setParameter("id", idd).executeUpdate();
        Album album = AlbumDao.findById(idd);
        for (Track t: album.getTracks()) {
            session.remove(t);
        }
        session.remove(album);
        tx1.commit();
        session.close();
    }



    public static List<Album> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Album")
                .list();
    }
}
