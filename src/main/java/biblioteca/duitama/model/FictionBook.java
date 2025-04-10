package biblioteca.duitama.model;

import java.util.*;

public class FictionBook extends Book {

    private String genre;
    private List<String> awards = new ArrayList<>();


    public FictionBook(int id, String name, String author, boolean available, String genre, List<String> awards) {

        super(id, name, "fiction", author, available);
        this.genre = genre;
        this.awards = awards;
    }


    public String getGenre() {
        return genre;
    }


    public void setGenre(String genre) {
        this.genre = genre;
    }


    public List<String> getAwards() {
        return awards;
    }


    public void setAwards(List<String> awards) {
        this.awards = awards;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("FictionBook{");
        sb.append("genre=").append(genre);
        sb.append(", awards=").append(awards);
        sb.append('}');
        return sb.toString();
    }

    

    
    
}
