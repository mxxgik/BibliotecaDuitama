package biblioteca.duitama.model;
public class NotFictionBook extends Book{

    private String themataicArea;
    private String targerAudience;

    public NotFictionBook(int id, String name, String author, boolean available, String themataicArea, String targerAudience) {

        super(id, name, "notFiction", author, available);
        this.themataicArea = themataicArea;
        this.targerAudience = targerAudience;

        
    }

    public String getThemataicArea() {
        return themataicArea;
    }

    public void setThemataicArea(String themataicArea) {
        this.themataicArea = themataicArea;
    }

    public String getTargerAudience() {
        return targerAudience;
    }

    public void setTargerAudience(String targerAudience) {
        this.targerAudience = targerAudience;
    }

    @Override
    public String toString() {
        return "NotFictionBook [themataicArea=" + themataicArea + ", targerAudience=" + targerAudience + "]";
    }

    
}
