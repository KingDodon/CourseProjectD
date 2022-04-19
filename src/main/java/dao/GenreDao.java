package dao;

import models.Album;
import models.Genre;
import models.Track;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class GenreDao {

    public static void update(Genre test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Genre test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }
    public static Genre findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Genre auu = session.get(Genre.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static int getMaxId(){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();

        String SQL_QUERY = "select max(genre_id)from Genre";
        Query query = session.createQuery(SQL_QUERY);
        List list = query.list();
        session.close();
        return (int) list.get(0);
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
//        String hql = "delete from Genre where genre_id = :id";
//        session.createQuery(hql).setParameter("id", idd).executeUpdate();
//        Genre genre = new Genre();
//        genre.setGenre_id(idd);
//        session.remove(genre);
        Genre genre = GenreDao.findById(idd);
        for (Track t: genre.getTracks()) {
            session.remove(t);
        }
        session.remove(genre);
        tx1.commit();
        session.close();
    }

    public static List<Genre> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Genre")
                .list();
    }
}
