package servlet.edit;

import dao.GenreDao;
import models.Genre;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editGenre")
public class EditGenreServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("genre_id"));
        String title = req.getParameter("title");
        Genre genre = new Genre();
        genre.setGenre_id(id);
        genre.setTitle(Utils.convertToUTF8(title));
        GenreDao.update(genre);
        resp.sendRedirect("/mainPage");
    }
}
