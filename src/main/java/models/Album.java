package models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "album")
public class Album {
    @Id
    @SequenceGenerator(name = "albumSeq", sequenceName = "SEQUENCE_ID_ALBUM", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "albumSeq")
    private int album_id;

    @Column(name = "title")
    private String title;

    @Column(name = "yearOfCreation")
    private Date yearOfCreation;

    @Column(name = "description")
    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "album_id")
    private List<Track> tracks;

    public Date getYearOfCreation() {
        return yearOfCreation;
    }

    public void setYearOfCreation(Date yearOfCreation) {
        this.yearOfCreation = yearOfCreation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(int album_id) {
        this.album_id = album_id;
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
