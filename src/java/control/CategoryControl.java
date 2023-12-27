package control;

import dao.DAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "CategoryControl", urlPatterns = {"/category"})
public class CategoryControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //lay cid
        String cateID = request.getParameter("cid");

        DAO dao = new DAO();
        if (!cateID.equals("0")) {
            List<Product> listP = dao.getProductByCID(cateID);
            List<Category> listC = dao.getAllCategory();
            Product last = dao.getLast();
            //b2 set data to jsp
            request.setAttribute("listC", listC);
            request.setAttribute("listP", listP);
            request.setAttribute("p", last);
            request.setAttribute("tag", cateID);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            List<Product> listP = dao.getAllProduct();
            List<Category> listC = dao.getAllCategory();
            Product last = dao.getLast();
            //b2 set data to jsp
            request.setAttribute("listC", listC);
            request.setAttribute("listP", listP);
            request.setAttribute("p", last);
            request.setAttribute("tag", 0);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
