package models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "genre")
public class Genre {
    @Id
//    @SequenceGenerator(name = "genreSeq", sequenceName = "SEQUENCE_ID_GENRE", allocationSize = 1)
//    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "genreSeq")
    private int genre_id;

    @Column(name = "title")
    private String title;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "genre", cascade=CascadeType.ALL)
    private List<Track> tracks;

    public int getGenre_id() {
        return genre_id;
    }

    public void setGenre_id(int genre_id) {
        this.genre_id = genre_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Track> getTracks() {
        return tracks;
    }

    public void setTracks(List<Track> tracks) {
        this.tracks = tracks;
    }
}
