package Control;

import Model.Book;
import Model.Catalogue;
import Persistance.BookLoader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

public class Initializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Catalogue catalogue = Catalogue.getInstance();
        
        try {
            BookLoader bookLoader = new BookLoader();
            ArrayList<Book> books = bookLoader.getBooks();
            for (Book book : books) {
                catalogue.addItemToCatalogue(book);
            }
        } catch (Exception ex) {
            Logger.getLogger(Initializer.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
