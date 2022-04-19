package servlet.add;

import dao.AlbumDao;
import models.Album;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addAlbum")
public class AddAlbumServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Album album = new Album();
        album.setAlbum_id(AlbumDao.getMaxId()+1);
        album.setTitle(Utils.convertToUTF8(req.getParameter("title")));
        album.setDescription(Utils.convertToUTF8(req.getParameter("description")));
        AlbumDao.save(album);
        resp.sendRedirect("/mainPage");
    }
}
