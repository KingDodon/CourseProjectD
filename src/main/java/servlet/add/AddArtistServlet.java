package servlet.add;

import dao.AlbumDao;
import dao.ArtistDao;
import models.Album;
import models.Artist;
import utils.Utils;

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
        artist.setArtist_id(ArtistDao.getMaxId()+1);
        artist.setName(Utils.convertToUTF8(req.getParameter("name")));
        artist.setDescription(Utils.convertToUTF8(req.getParameter("description")));
        ArtistDao.save(artist);
        resp.sendRedirect("/mainPage");
    }
}