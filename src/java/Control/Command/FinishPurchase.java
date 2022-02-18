package Control.Command;

import Model.Book;
import Model.Cart;
import Model.Catalogue;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class FinishPurchase extends FrontCommand {
        
    @Override
    public void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("shoppingCart");
        request.setAttribute("total", cart.finishPurchase());
        cart.emptyCart();
        forward("/finishPurchasePage.jsp");
        
    }
}