package servlet.add;

import dao.AlbumDao;
import dao.ArtistDao;
import models.Album;
import models.Artist;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addArtist")
public class AddArtistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Artist artist = new Artist();
        System.out.println(req.getParameter("name"));
        artist.setName(req.getParameter("name"));
        artist.setDescription(req.getParameter("description"));
        ArtistDao.save(artist);
        resp.sendRedirect("/mainPage");
    }
}