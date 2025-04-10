package biblioteca.duitama.model;


public abstract class Book {
    
    private int id;
    private String name;
    private String type;
    private String author;
    private boolean available;


    public Book(int id, String name, String type, String author, boolean available) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.author = author;
        this.available = available;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }


    public String getAuthor() {
        return author;
    }


    public void setAuthor(String author) {
        this.author = author;
    }


    public boolean isAvailable() {
        return available;
    }


    public void setAvailable(boolean available) {
        this.available = available;
    }


    @Override
    public String toString() {
        return "Book [id=" + id + ", name=" + name + ", type=" + type + ", author=" + author + ", available=" + available + "]";
    }

    


    

}
