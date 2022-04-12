package servlet.edit;

import dao.AlbumDao;
import models.Album;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editAlbum")
public class EditAlbumServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("album_id"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        Album album = new Album();
        album.setAlbum_id(id);
        album.setTitle(title);
        album.setDescription(description);
        AlbumDao.update(album);
        resp.sendRedirect("/mainPage");
    }
}