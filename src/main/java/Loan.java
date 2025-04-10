
import java.util.Date;


public class Loan {
    private int loanId;
    private int bookId;
    private Book book;
    private String borrowerName;
    private int borrowerId;
    private Date borrowDate;
    private Date dueDate;
    private Date returnDate;


    public Loan(int loanId, int bookId,Book book, String borrowerName, int borrowerId, Date borrowDate, Date dueDate) {
        this.loanId = loanId;
        this.bookId = bookId;
        this.book = book;
        this.borrowerName = borrowerName;
        this.borrowerId = borrowerId;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.returnDate = null;

        book.setAvailable(false);
    }


    public int getBookId() {
        return bookId;
    }

    public int getLoanId() {
        return loanId;
    }


    public void setBookId(int id) {
        this.bookId = id;
    }

    public void setLoanId(int id) {
        this.loanId = id;
    }


    public Book getBook() {
        return book;
    }


    public void setBook(Book book) {
        this.book = book;
    }


    public String getBorrowerName() {
        return borrowerName;
    }


    public void setBorrowerName(String borrowerName) {
        this.borrowerName = borrowerName;
    }


    public int getBorrowerId() {
        return borrowerId;
    }


    public void setBorrowerId(int borrowerId) {
        this.borrowerId = borrowerId;
    }


    public Date getBorrowDate() {
        return borrowDate;
    }


    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }


    public Date getDueDate() {
        return dueDate;
    }


    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }


    public Date getReturnDate() {
        return returnDate;
    }


    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public void returnBook(Date returnDate){
        this.returnDate = returnDate;
        book.setAvailable(true);
    }

    public boolean isActive(){
        return returnDate == null;
    }


    public boolean isOverdue(){
        if (!isActive()) {
            return false;
        }

        Date today = new Date();
        return today.after(dueDate);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Loan{");
        sb.append("loanId=").append(loanId);
        sb.append(", bookId=").append(bookId);
        sb.append(", book=").append(book);
        sb.append(", borrowerName=").append(borrowerName);
        sb.append(", borrowerId=").append(borrowerId);
        sb.append(", borrowDate=").append(borrowDate);
        sb.append(", dueDate=").append(dueDate);
        sb.append(", returnDate=").append(returnDate);
        sb.append('}');
        return sb.toString();
    }

    

    




    

}
