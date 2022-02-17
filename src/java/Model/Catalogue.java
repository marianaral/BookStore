package Model;

import java.util.ArrayList;

public final class Catalogue {
    private static Catalogue instance;
    private ArrayList<Book> catalogue = new ArrayList<>();
    
    public static Catalogue getInstance(){
        if(instance == null){
            instance = new Catalogue();
        }
        return instance;
    }

    public ArrayList<Book> getCatalogue() {
        return catalogue;
    }
    
    public void addItemToCatalogue(Book book){
        boolean added = false;
        for (Book item : catalogue) {
            if(item.equals(book)){
                added = true;
            }
        }
        if(added == false){
            catalogue.add(book);
        }   
    }
    
    public void deleteItemFromCatalogue(Book book){
        catalogue.remove(book);
        
    }
    
    public Book find(String isbn){
        for (Book book : getCatalogue()) {
            if(book.getIsbn().equals(isbn)) {
                return book;
            }
        }
        return null;
    }
    
    
    
}
