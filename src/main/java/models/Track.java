package models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "track")
public class Track {
    @Id
    @SequenceGenerator(name = "trackSeq", sequenceName = "SEQUENCE_ID_TRACK", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "trackSeq")
    private int track_id;

    @Column(name = "title")
    private String title;

    @Column(name = "duration")
    private int duration;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_id")
    private Genre genre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "album_id")
    private Album album;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Artist> artists = new HashSet<>();

    public Set<Artist> getArtist() {
        return artists;
    }

    public void setArtist(Set<Artist> artists) {
        this.artists = artists;
    }

    public String getArrayId(){
        String str = new String();
        int i = 0;
        for (Artist artist: artists) {
            str = str + " " + artist.getArtist_id();
            i++;
        }
        return str;
    }

    public int getTrack_id() {
        return track_id;
    }

    public void setTrack_id(int track_id) {
        this.track_id = track_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }
}
