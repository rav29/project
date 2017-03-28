import java.time.LocalDate;
import java.util.HashSet;


/**
 * Created by Radion on 26.03.2017.
 */
public class Film {
    private String title;
    private HashSet<MemberOfFilmCrew> actors;
    private MemberOfFilmCrew director;
    private LocalDate dateOfProduction;
    private String country;
    private String genre;

    public Film(String title, HashSet<MemberOfFilmCrew> actors, MemberOfFilmCrew director, LocalDate dateOfProduction, String country, String genre) {
        this.title = title;
        this.actors = actors;
        this.director = director;
        this.dateOfProduction = dateOfProduction;
        this.country = country;
        this.genre = genre;
    }

    public String getTitle() {
        return title;
    }

    public HashSet<MemberOfFilmCrew> getActors() {
        return actors;
    }

    public MemberOfFilmCrew getDirector() {
        return director;
    }

    public LocalDate getDateOfProduction() {
        return dateOfProduction;
    }

    public String getCountry() {
        return country;
    }

    public String getGenre() {
        return genre;
    }
}
