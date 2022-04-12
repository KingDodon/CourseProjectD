package servlet.add;

import dao.AlbumDao;
import models.Album;

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
        resp.setContentType("text/html");
        Album album = new Album();
        album.setTitle(req.getParameter("title"));
        album.setDescription(req.getParameter("description"));
        AlbumDao.save(album);
        resp.sendRedirect("/mainPage");
    }
}
