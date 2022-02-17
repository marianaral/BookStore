package Model;

import java.util.ArrayList;
import java.util.HashMap;

public class Cart {
    private HashMap<String, Integer> cartList = new HashMap<>();

    public HashMap<String, Integer> getCartList() {
        return cartList;
    }
    
    public void addItemToCart(String isbn){
        if(! cartList.containsKey(isbn)){
            cartList.put(isbn,1);
        }
    }
        
    public void deleteItemFromCart(String isbn){
        cartList.remove(isbn);
    }
    
    public double finishPurchase(){
        double total = 0;
        for (String isbn : cartList.keySet()) {
            Book book = Catalogue.getInstance().find(isbn);
            total += book.getPrice() * cartList.get(isbn);
        }
        return total;
    }
    
    public void icreaseQuantity(String isbn) {
         if(cartList.containsKey(isbn)){
             int quantity = cartList.get(isbn) + 1;
            cartList.put(isbn, quantity);
        }
    }
    
    public void decreaseQuantity(String isbn) {
         if(cartList.containsKey(isbn)){
            int quantity = cartList.get(isbn);
            if(quantity > 1){
                quantity = quantity - 1;
                cartList.put(isbn, quantity);
            }
            
        }
    }
    
    public void emptyCart(){
        cartList.clear();
    }
    
}
