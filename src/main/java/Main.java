import dao.GenreDao;
import models.Genre;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

public class Main {
    public static void main(String[] args) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        session.close();
    }
}
