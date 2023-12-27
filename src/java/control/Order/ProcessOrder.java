package control.Order;

import dao.DAO;
import entity.AES;
import entity.Cart;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "ProcessOrder", urlPatterns = {"/processorder"})
public class ProcessOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phonenumber");
        String userName = request.getParameter("username");

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        DAO dao = new DAO();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            user = dao.checkUserExist(email);
            System.out.println("ProcessOrder.java: " + user);
            if (user != null) {
                final String secretKey = "TrinhVietHieu0112!!!@@@";
                String passwordDecrypted = AES.decrypt(user.getUser_password(), secretKey);
                if (password.equals(passwordDecrypted)) {
                    session.setAttribute("acc", user);
                    Cookie uid = new Cookie("id", user.getUser_id() + "");
                    Cookie cu = new Cookie("email", email);
                    Cookie cp = new Cookie("pass", password);
                    uid.setMaxAge(0);
                    cu.setMaxAge(0);
                    cp.setMaxAge(0);
                    response.addCookie(uid);
                    response.addCookie(cu);
                    response.addCookie(cp);
                } else {
                    String ms = "Login Fail";
                    request.setAttribute("login_wrong", ms);
                    request.getRequestDispatcher("Info.jsp").forward(request, response);
                }
            } else {
                String ms = "Login Fail";
                request.setAttribute("login_wrong", ms);
                request.getRequestDispatcher("Info.jsp").forward(request, response);
            }
        }

        List<Product> listP = dao.getAllProduct();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, listP);
        System.out.println("ProcessOrder.java: " + cart);
        Order order = new Order(user.getUser_id(), date, cart.getTotalMoney(), address, phoneNumber);
        session.setAttribute("cart", cart);
        session.setAttribute("username", userName);
        session.setAttribute("order", order);
        response.sendRedirect("invoicing");
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
