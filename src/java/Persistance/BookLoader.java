package Persistance;

import Model.Book;
import java.io.FileReader;
import java.io.InputStream;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import org.json.simple.parser.JSONParser;


public class BookLoader {
    private final ArrayList<Book> books = new ArrayList<>();
    public ArrayList<Book> getBooks() throws Exception {                
        InputStream file = getClass().getResourceAsStream("books_ulr.json");
        
        JsonArray ob = Json.createReader(file).readArray();
        
        for (int i = 0; i < ob.size(); i++) {
            JsonObject bookObject = (JsonObject) ob.get(i);
            String title = bookObject.getString("title");
            String isbn = bookObject.getString("isbn");
            Double price = Math.random() * 30;     
            books.add(new Book(title, isbn, price));        
        }  
        System.out.println("Aqui");
        return books;
    }
    
 
    
    
}
