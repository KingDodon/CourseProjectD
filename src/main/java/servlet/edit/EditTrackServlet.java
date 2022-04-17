package servlet.edit;

import dao.AlbumDao;
import dao.ArtistDao;
import dao.GenreDao;
import dao.TrackDao;
import models.Artist;
import models.Track;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/editTrack")
public class EditTrackServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        System.out.println(req.getParameter("track_id"));
        System.out.println(req.getParameter("title"));
        System.out.println(req.getParameter("duration"));
        System.out.println(req.getParameter("album_id"));
        System.out.println(req.getParameter("genre_id"));
        System.out.println(req.getParameter("artist_id"));
        int id = Integer.parseInt(req.getParameter("track_id"));
        String title = req.getParameter("title");
        String duration = req.getParameter("duration");
        String album_id = req.getParameter("album_id");
        String genre_id = req.getParameter("genre_id");
        String[] artist = req.getParameterValues("artist_id");


        Track track = new Track();
        track.setTrack_id(id);
        track.setTitle(title);
        track.setDuration(Integer.parseInt(duration));
        track.setAlbum(AlbumDao.findById(Integer.parseInt(album_id)));
        track.setGenre(GenreDao.findById(Integer.parseInt(genre_id)));

        List<Integer> list = new ArrayList<>();
        for (String s : artist) {
            list.add(Integer.parseInt(s));
        }
        List<Artist> artists = ArtistDao.findByIdList(list);
        Set<Artist> artistSet = new HashSet<>(artists);
        track.setArtist(artistSet);

        TrackDao.update(track);

        resp.sendRedirect("/mainPage");
    }
}
