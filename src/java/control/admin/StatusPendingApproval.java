package control.admin;

import dao.DAO;
import entity.Order;
import entity.OrderDetail;
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
@WebServlet(name = "StatusPendingApproval", urlPatterns = {"/pendingapproval"})
public class StatusPendingApproval extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        DAO dao = new DAO();
        String orderID_raw = request.getParameter("order_id");
        int order_id = Integer.parseInt(orderID_raw);
        dao.editStatusOrderPendingApproval(order_id);
        List<Order> listO = dao.getAllOrder();
        List<OrderDetail> listOD = dao.getAllOrderDetail();

        request.setAttribute("listOD", listOD);
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("ManageOrder.jsp").forward(request, response);

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
