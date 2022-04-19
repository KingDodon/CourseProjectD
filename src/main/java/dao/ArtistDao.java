package dao;

import models.Album;
import models.Artist;
import models.Genre;
import models.Track;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HibernateSessionFactoryUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArtistDao {

    public static void update(Artist test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Artist test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }
    public static Artist findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Artist auu = session.get(Artist.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static List<Artist> findByIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Artist p WHERE p.id IN :ids";
        List<Artist> artists = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return artists;
    }

    public static int getMaxId(){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();

        String SQL_QUERY = "select max(artist_id)from Artist";
        Query query = session.createQuery(SQL_QUERY);
        List list = query.list();
        session.close();
        return (int) list.get(0);
    }

    public static void delById(int idd){
        String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
        String USER = "postgres";
        String PASS = "123456";
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS)){
            PreparedStatement preparedStatement = connection.prepareStatement("select tracks_track_id from track_artist where artists_artist_id = ? and tracks_track_id not in (select tracks_track_id from track_artist where artists_artist_id != ?)");
            preparedStatement.setInt(1,idd);
            preparedStatement.setInt(2,idd);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Integer> arrayList = new ArrayList<>();
            while (resultSet.next()){
                arrayList.add(resultSet.getInt(1));
            }
            preparedStatement = connection.prepareStatement("delete from track_artist where artists_artist_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement = connection.prepareStatement("delete from artist where artist_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            for (int id: arrayList) {
                preparedStatement = connection.prepareStatement("delete from track where track_id = ?;");
                preparedStatement.setInt(1, id);
                preparedStatement.execute();
            }
            preparedStatement.close();
        } catch (SQLException ex){
            ex.printStackTrace();
        }
    }
    public static List<Artist> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Artist")
                .list();
    }
}
