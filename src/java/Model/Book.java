package Model;

import java.text.DecimalFormat;

public class Book {
    private final String title;
    private final String isbn;
    private Double price;
   

    public Book(String title, String isbn, Double price) {
        this.title = title;
        this.isbn = isbn;
        this.price = price;
        
    }

    public String getTitle() {
        return title;
    }

    public String getIsbn() {
        return isbn;
    }

    public Double getPrice() {
        return Math.round(price * 100d) / 100d;
    }
    

    
    
    
}
