
import java.util.*;

public class BookManager {

    private static BookManager instance;
    private final ArrayList<Book> books;
    private final ArrayList<Loan> loans;
    private final int nextLoanId;
    private int nextBookId;


    public BookManager() {
        books = new ArrayList<>();
        loans = new ArrayList<>();
        nextLoanId = 1;
        nextBookId = 1;

        addSampleData();
    }

    public static synchronized BookManager getInstance(){
        if (instance == null) {
            instance = new BookManager();
        }
        return instance;
    }

    public void addBook(Book book){
        books.add(book);
    }

    private void addSampleData(){

        addBook(new FictionBook(nextBookId++, "The Night Circus", "Erin Morgenstern", true, "Fantasy", Arrays.asList("Locus Award for Best First Novel", "Mythopoeic Fantasy Award for Adult Literature")));
		addBook(new FictionBook(nextBookId++, "The Underground Railroad", "Colson Whitehead",false ,"Historical Fiction", Arrays.asList("Pulitzer Prize for Fiction", "National Book Award for Fiction")));
		addBook(new FictionBook(nextBookId++, "Where the Crawdads Sing", "Delia Owens", true,"Mystery/Thriller", Arrays.asList("Goodreads Choice Award for Fiction", "Barnes & Noble Discover Great New Writers")));
		addBook(new FictionBook(nextBookId++, "The Goldfinch", "Donna Tartt", false,"Literary Fiction", Arrays.asList("Pulitzer Prize for Fiction", "Andrew Carnegie Medal for Excellence in Fiction")));
		addBook(new FictionBook(nextBookId++, "The Road", "Cormac McCarthy", true,"Post-apocalyptic", Arrays.asList("Pulitzer Prize for Fiction", "James Tait Black Memorial Prize for Fiction")));

		
		addBook(new NotFictionBook(nextBookId++, "Sapiens: A Brief History of Humankind", "Yuval Noah Harari", true,"History", "General Audience"));
		addBook(new NotFictionBook(nextBookId++, "Becoming", "Michelle Obama", true,"Autobiography", "General Audience"));
		addBook(new NotFictionBook(nextBookId++, "Educated", "Tara Westover", false,"Memoir", "General Audience"));
		addBook(new NotFictionBook(nextBookId++, "The Immortal Life of Henrietta Lacks", "Rebecca Skloot", false,"Biography", "General Audience"));
		addBook(new NotFictionBook(nextBookId++, "The Body Keeps the Score", "Bessel van der Kolk", true,"Psychology", "Adults with an interest in mental health"));

		
		addBook(new ReferenceBook(nextBookId++, "The Structure of Scientific Revolutions", "Thomas S. Kuhn", false,"Philosophy of Science", false));
		addBook(new ReferenceBook(nextBookId++, "Principles of Economics", "N. Gregory Mankiw", true,"Economics", true));
		addBook(new ReferenceBook(nextBookId++, "Introduction to Algorithms", "Thomas H. Cormen", false,"Computer Science", true));
		addBook(new ReferenceBook(nextBookId++, "The Selfish Gene", "Richard Dawkins", false,"Evolutionary Biology", false));  
		addBook(new ReferenceBook(nextBookId++, "A Brief History of Time", "Stephen Hawking", false,"Physics", false));  

    }
    
    
}
