package servlet.add;

import dao.ArtistDao;
import models.Artist;
import models.Track;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addTrack")
public class AddTrackServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Track track = new Track();
        track.setTitle(req.getParameter("title"));
        track.setDuration(Integer.parseInt(req.getParameter("duration")));
    }
}