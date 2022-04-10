package servlet;

import dao.AlbumDao;
import dao.ArtistDao;
import dao.GenreDao;
import dao.TrackDao;
import models.Album;
import models.Artist;
import models.Genre;
import models.Track;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/mainPage")
public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Album> listAlbum = AlbumDao.findAll();
        List<Artist> listArtist = ArtistDao.findAll();
        List<Genre> listGenre = GenreDao.findAll();
        List<Track> listTrack = TrackDao.findAll();
        req.setAttribute("listAlbum", listAlbum);
        req.setAttribute("listArtist", listArtist);
        req.setAttribute("listGenre", listGenre);
        req.setAttribute("listTrack", listTrack);

        req.getRequestDispatcher("/MainPage.jsp").forward(req,resp);
    }
}
