package servlet.add;

import dao.GenreDao;
import models.Genre;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@WebServlet("/addGenre")
public class AddGenreServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Genre genre = new Genre();
        genre.setGenre_id(GenreDao.getMaxId()+1);
        genre.setTitle(Utils.convertToUTF8(req.getParameter("title")));
        GenreDao.save(genre);
        resp.sendRedirect("/mainPage");
    }
}
