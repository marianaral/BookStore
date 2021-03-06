package Control.Command;

import Control.Command.FrontCommand;
import Model.Book;
import Model.Cart;
import Model.Catalogue;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class IncreaseQuantity extends FrontCommand {
        
    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("shoppingCart");
        
        Catalogue catalogue = Catalogue.getInstance();
        String isbn = request.getParameter("productIsbn");
        if (catalogue.find(isbn) != null){
            cart.icreaseQuantity(isbn);
        }  
        forward("/CartPage.jsp");
        
    }
}