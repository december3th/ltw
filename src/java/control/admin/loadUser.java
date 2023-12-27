package control.admin;

import dao.DAO;
import entity.AES;
import entity.User;
import java.io.IOException;
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
@WebServlet(name = "loadUser", urlPatterns = {"/loaduser"})
public class loadUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uid = request.getParameter("uid");
        DAO dao = new DAO();
        User user = dao.getUserByID(uid);
        List<User> listU = dao.getAllUser();
        final String secretKey = "TrinhVietHieu0112!!!@@@";
        request.setAttribute("listU", listU);
        user.setUser_password(AES.decrypt(user.getUser_password(), secretKey));
        request.setAttribute("user", user);
        request.setAttribute("ms", "show");
        request.getRequestDispatcher("EditAccount.jsp").forward(request, response);
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
