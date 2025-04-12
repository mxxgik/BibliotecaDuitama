package biblioteca.duitama.model;
public class NotFictionBook extends Book{

    private String thematicArea;
    private String targetAudience;

    public NotFictionBook(int id, String name, String author, boolean available, String thematicArea, String targetAudience) {

        super(id, name, "No Ficcion", author, available);
        this.thematicArea = thematicArea;
        this.targetAudience = targetAudience;

        
    }

    public String getthematicArea() {
        return thematicArea;
    }

    public void setthematicArea(String thematicArea) {
        this.thematicArea = thematicArea;
    }

    public String gettargetAudience() {
        return targetAudience;
    }

    public void settargetAudience(String targetAudience) {
        this.targetAudience = targetAudience;
    }

    @Override
    public String toString() {
        return "NotFictionBook [thematicArea=" + thematicArea + ", targetAudience=" + targetAudience + "]";
    }

    
}
