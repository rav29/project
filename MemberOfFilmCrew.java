import java.time.LocalDate;

/**
 * Created by Radion on 26.03.2017.
 */
public class MemberOfFilmCrew {
    private String fullName;
    private LocalDate dateOfBirth;

    public String getFullName() {
        return fullName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + getFullName().length();
        result = prime * result + getDateOfBirth().getDayOfYear() + getDateOfBirth().getYear()
                                + getDateOfBirth().getDayOfMonth();
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof MemberOfFilmCrew)) return false;
        MemberOfFilmCrew memberOfFilmCrew = (MemberOfFilmCrew) o;
        return getFullName().equals(memberOfFilmCrew.getFullName()) && getDateOfBirth().equals(memberOfFilmCrew.dateOfBirth);
    }
}
