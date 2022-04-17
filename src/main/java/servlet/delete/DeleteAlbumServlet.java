package servlet.delete;

import dao.AlbumDao;
import dao.TrackDao;
import models.Album;
import models.Track;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/deleteAlbum")
public class DeleteAlbumServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("album_id"));
        AlbumDao.delById(id);
        resp.sendRedirect("/mainPage");
    }
}