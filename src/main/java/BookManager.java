
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

    public ArrayList<Book> getAllBooks(){
        return books;
    }

    public ArrayList<Book> getAvailableBooks(){
        ArrayList<Book> availableBooks = new ArrayList<>();
        for (Book book : books) {
            if (book.isAvailable()) {
                availableBooks.add(book);
            }
        }
        return availableBooks;
    }

    public Book getBookById(int id){

        for (Book book : books) {
            if (book.getId() == id) {
                return book;
            }
        }
        return null;
    }

    public boolean updateBook(Book bookToUpdate){

        for (int index = 0; index < books.size(); index++) {
            if (books.get(index).getId() == bookToUpdate.getId()) {
                books.set(index, bookToUpdate);
                return true;
            }
        }
        return false;
    }

    public boolean deleteBook(int id) {
		for (Loan loan : loans) {
			if (loan.getBook().getId() == id && loan.isActive()) {
				return false;
			}
		}

		for (int i = 0; i < books.size(); i++) {
			if (books.get(i).getId() == id) {
				books.remove(i);
				return true;
			}
		}

		return false;
	}

	public Loan createLoan(int bookId, String borrowerName, int borrowerId, int loanDays) {
		Book book = getBookById(bookId);

		if (book == null || !book.isAvailable()) {
			return null;
		}

		Date loanDate = new Date();

		Date dueDate = new Date(loanDate.getTime() + (loanDays * 24 * 60 * 60 * 1000L));

		Loan loan = new Loan(nextBookId++, book, borrowerName, borrowerId, loanDate, dueDate);
		loans.add(loan);
		return loan;
	}

    public ArrayList<Loan> getAllLoans(){
        return loans;
    }

    public Loan getLoanById(int id) {
		for (Loan loan : loans) {
			if (loan.getId() == id) {
				return loan;
			}
		}
		return null;
	}

    public ArrayList<Loan> getActiveLoans() {
		ArrayList<Loan> activeLoans = new ArrayList<>();
		for (Loan loan : loans) {
			if (loan.isActive()) {
				activeLoans.add(loan);
			}
		}
		return activeLoans;
	}

    public boolean returnBook(int id){

        Loan loan = getLoanById(id);
        
        if (loan == null || !loan.isActive()) {
            return false;
        }


        loan.returnBook(new Date());
        return true;
    }

    public int getNextBookId(){
        
        return nextBookId;

    }

    
    
}
