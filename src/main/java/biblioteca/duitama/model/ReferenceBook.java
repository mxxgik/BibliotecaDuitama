package biblioteca.duitama.model;
public class ReferenceBook extends Book {

    private String field;
    private boolean lendable;

    public ReferenceBook(int id, String name, String author, boolean available, String field, boolean lendable) {

        super(id, name, "Referencia", author, available);
        this.field = field;
        this.lendable = lendable;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public boolean isLendable() {
        return lendable;
    }

    public void setLendable(boolean lendable) {
        if (lendable == false) {
            setAvailable(false);
        }else{
            setAvailable(true);
        }

        this.lendable = lendable;

    }

    @Override
    public String toString() {
        return "ReferenceBook [field=" + field + ", lendable=" + lendable + "]";
    }

    

    
    
}
