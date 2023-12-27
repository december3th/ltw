
package control.api;

import com.google.gson.Gson;
import dao.NewsDAO;
import entity.News;
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
@WebServlet(name = "NewsAPI", urlPatterns = {"/newsapi"})
public class NewsAPI extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewsAPI</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsAPI at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("application/json");
//       Gson jsonConverter = new Gson();
//        PrintWriter jsonPrinter = response.getWriter();
//        NewsDAO newsDao = new NewsDAO();
//        List<News> list1 = newsDao.getAllNews();
//
//        int numberpage = 2;
//        int size = list1.size();
//
//        String xpage = request.getParameter("page");
//        int page;
//
//        if (xpage == null) {
//            page = 1;
//        } else {
//            page = Integer.parseInt(xpage);
//        }
//        int start, end;
//        start = (page - 1) * numberpage;
//        end = Math.min(page * numberpage, size);
//        List<News> list = newsDao.getListByPage(list1, start, end);
//        String numJson = jsonConverter.toJson(list);
//        jsonPrinter.print(numJson); 
        response.setContentType("application/json");
        Gson JsonConverter = new Gson();
        PrintWriter JsonPrinter = response.getWriter();
        NewsDAO newsDao = new NewsDAO();
        List<News> list = newsDao.getAllNews();
        String numJson = JsonConverter.toJson(list);
        JsonPrinter.print(numJson);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
