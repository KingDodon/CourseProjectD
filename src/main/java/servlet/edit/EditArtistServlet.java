package servlet.edit;

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

@WebServlet("/editArtist")
public class EditArtistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("artist_id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        Artist artist = new Artist();
        artist.setArtist_id(id);
        artist.setName(name);
        artist.setDescription(description);
        ArtistDao.update(artist);
        resp.sendRedirect("/mainPage");
    }
}