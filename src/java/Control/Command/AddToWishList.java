package Control.Command;

import Model.Book;
import Model.Cart;
import Model.Catalogue;
import Model.Wishlist;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AddToWishList extends FrontCommand {
        
    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Wishlist wishList = (Wishlist) session.getAttribute("wishList");
        
        Catalogue catalogue = Catalogue.getInstance();
        String isbn = request.getParameter("productIsbn");
        if (catalogue.find(isbn) != null){
            wishList.addItemToWishList(isbn);
        }  
        forward("/WishListPage.jsp");
        
    }
}