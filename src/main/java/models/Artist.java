package models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "artist")
public class Artist {
    @Id
    @SequenceGenerator(name = "artistSeq", sequenceName = "SEQUENCE_ID_ARTIST", allocationSize = 1)
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "artistSeq")
    private int artist_id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @ManyToMany(mappedBy = "artist")
    private Set<Track> tracks = new HashSet<>();

    public int getArtist_id() {
        return artist_id;
    }

    public void setArtist_id(int artist_id) {
        this.artist_id = artist_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Track> getTracks() {
        return tracks;
    }

    public void setTracks(Set<Track> tracks) {
        this.tracks = tracks;
    }
}
