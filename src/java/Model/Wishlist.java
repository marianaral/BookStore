package Model;

import java.util.HashMap;

public class Wishlist {
    private HashMap<String, Integer> wishList = new HashMap<>();

    public HashMap<String, Integer> getWishList() {
        return wishList;
    }    

    public void addItemToWishList(String isbn){
        if(! wishList.containsKey(isbn)){
            wishList.put(isbn,1);
        }
    }
        
    public void deleteItemFromWishList(String isbn){
        wishList.remove(isbn);
    }
    
    
    public void emptywishList(){
        wishList.clear();
    }
    
}
